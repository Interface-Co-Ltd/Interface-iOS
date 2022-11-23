//
//  SearchView.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/10.
//

import SwiftUI

enum SearchType {
    case board
    case schedule
    //        case all
}

struct SearchView: View {
    @Binding var isSearching: Bool
    
    @EnvironmentObject var boardViewModel: BoardViewModel
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    
    @State private var searchType: SearchType = .board
    @State private var isEmptyTextField: Bool = true
    @State private var keyword = ""
    @State private var textFieldFocused = true
    
    @State private var matchedBoardList: [Board] = []
    @State private var matchedScheduleList: [Schedule] = []
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                if #available(iOS 15.0, *) {
                    TextField("검색", text: $keyword, prompt: Text("검색어를 입력하세요."))
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .modifier(AutoTextFieldFocusModifier(focused: $textFieldFocused))
                } else {
                    TextField("검색어를 입력하세요.", text: $keyword)
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                }
                
                if !isEmptyTextField {
                    Button {
                        withAnimation(.easeInOut) {
                            keyword = ""
                        }
                    } label: {
                        Text("취소")
                    }
                }
            }
            .padding([.horizontal, .top])
            
            HStack(spacing: 15) {
                Button {
                    withAnimation(.easeInOut) {
                        searchType = searchType == .board ? .schedule : .board
                        if keyword != "" {
                            keyword = ""
                        }
                        
                        matchedBoardList = []
                        matchedScheduleList = []
                    }
                } label: {
                    Text("공지사항")
                        .font(.footnote)
                        .padding(5)
                        .padding(.horizontal, 5)
                        .modifier(VersionedSubViewBackgroundModifier(color: searchType == .board ? .accentColor : Color("sub-view-bkg")))
                }
                .foregroundColor(searchType == .board ? .white : .primary)
                
                Button {
                    withAnimation(.easeInOut) {
                        searchType = searchType == .schedule ? .board : .schedule
                        if keyword != "" {
                            keyword = ""
                        }
                        
                        matchedBoardList = []
                        matchedScheduleList = []
                    }
                } label: {
                    Text("일정")
                        .font(.footnote)
                        .padding(5)
                        .padding(.horizontal, 5)
                        .modifier(VersionedSubViewBackgroundModifier(color: searchType == .schedule ? .accentColor : Color("sub-view-bkg")))
                }
                .foregroundColor(searchType == .schedule ? .white : .primary)
                
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView {
                if searchType == .board {
                    LazyVStack {
                        ForEach(matchedBoardList) { item in
                            VStack(spacing: 10) {
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.secondary.opacity(0.1))
                                
                                HStack {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(item.title)
                                        
                                        Text(item.stringCreatedDate())
                                            .font(.caption2)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("작성자 : \(item.userID)")
                                        .font(.caption2)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .onChange(of: keyword) { newValue in
                        withAnimation(.interactiveSpring()) {
                            if newValue.count > 0 {
                                if let list = boardViewModel.boardList {
                                    matchedBoardList = list.filter {
                                        $0.title.contains(newValue) || $0.content.contains(newValue)
                                    }
                                }
                                
                                isEmptyTextField = false
                            } else {
                                matchedBoardList = []
                            }
                            
                            if newValue.count == 0 {
                                matchedScheduleList = []
                                
                                isEmptyTextField = true
                            }
                        }
                    }
                    
                } else {
                    LazyVStack {
                        ForEach(matchedScheduleList) { item in
                            NavigationLink {
                                if let scheduleList = scheduleViewModel.scheduleList {
                                    InformationWithSelectionView(schedule: scheduleList, currentDate: item.startDate)
                                }
                            } label: {
                                VStack(spacing: 10) {
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(.secondary.opacity(0.1))
                                    
                                    HStack {
                                        VStack(alignment: .trailing, spacing: 2) {
                                            Image(item.div == "세종대학교" ? "sejong-univ-logo" : "interface-logo")
                                                .resizable()
                                                .frame(width: 15, height: 15)
                                                .opacity(0.7)
                                        }
                                        
                                        HStack(spacing: 5) {
                                            Text(item.content)
                                                .allowsTightening(true)
                                            
                                            Spacer()
                                            
                                            if item.startDate == item.endDate {
                                                Text(item.getStartDateString())
                                                    .font(.caption)
                                                    .foregroundColor(.secondary)
                                            } else {
                                                Text("\(item.getStartDateString())~\(item.getEndDateString())")
                                                    .font(.caption)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                    }
                                }
                            }
                            .foregroundColor(.primary)

                        }
                        .padding(.horizontal)
                        .onChange(of: keyword) { newValue in
                            withAnimation(.interactiveSpring()) {
                                if newValue.count > 0 {
                                    if let list = scheduleViewModel.scheduleList {
                                        matchedScheduleList = list.filter {
                                            $0.content.contains(newValue)
                                        }
                                    }
                                    
                                    isEmptyTextField = false
                                } else {
                                    matchedScheduleList = []
                                }
                                
                                if newValue.count == 0 {
                                    matchedScheduleList = []
                                    
                                    isEmptyTextField = true
                                }
                            }
                        }
                    }
                }
            }
        }
        .toolbar{
            ToolbarItem {
                if #available(iOS 15.0, *) {
                    Button {
                        withAnimation(.easeInOut) {
                            isSearching = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.secondary)
                            .padding()
                            .frame(maxWidth: 30, maxHeight: 30)
                            .modifier(VersionedUltraThinMaterialEffect())
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.15), radius: 3)
                    }
                }
            }
        }
        .navigationTitle("검색")
        .background(Color("bkg").ignoresSafeArea())
        .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isSearching: .constant(true))
            .environmentObject(BoardViewModel.preview)
            .environmentObject(ScheduleViewModel.preview)
    }
}
