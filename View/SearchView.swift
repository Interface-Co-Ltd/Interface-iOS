//
//  SearchView.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/10.
//

import SwiftUI

struct SearchView: View {
    @Binding var isSearching: Bool
    @Binding var boardList: [Board]
    @Binding var scheduleList: [Schedule]
    
    @State private var searchType: SearchType = .board
    @State private var closeButtonMode: CloseButtonMode = .close
    
    @State private var matchedBoardList: [Board] = []
    @State private var matchedScheduleList: [Schedule] = []
    @State private var keyword = ""
    
    enum SearchType {
        case board
        case schedule
//        case all
    }
    
    enum CloseButtonMode {
        case cancel
        case close
    }
    
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
                VStack {
                    HStack(spacing: 20) {
                        Button {
                            withAnimation(.easeInOut) {
                                searchType = searchType == .board ? .schedule : .board
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
                    .padding()
                    
                    HStack(spacing: 20) {
                        TextField("검색", text: $keyword, prompt: Text("검색어를 입력하세요."))
                            .textFieldStyle(.roundedBorder)
                        
                        Button {
                            withAnimation(.easeInOut) {
                                if closeButtonMode == .cancel {
                                    keyword = ""
                                } else {
                                    isSearching = false
                                }
                            }
                        } label: {
                            Text(closeButtonMode == .close ? "닫기" : "취소")
                        }
                    }
                    .padding(.horizontal)
                        
                        if searchType == .board {
                            List(matchedBoardList) { item in
                                Text(item.title)
                                    .listRowBackground(Color("bkg"))
                            }
                            .listStyle(.plain)
                            .onAppear() {
                                UITableView.appearance().backgroundColor = .clear
                            }
                            .background(Color("bkg").ignoresSafeArea())
                            .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
                            //                        .searchable(text: $keyword, placement: .automatic, prompt: "검색어를 입력하세요") {
                            //
                            //                        }
                            .onSubmit {
                                if keyword.count > 0 {
                                    matchedBoardList = boardList.filter {
                                        $0.title.contains(keyword) || $0.content.contains(keyword)
                                    }
                                    closeButtonMode = .cancel
                                } else {
                                    matchedBoardList = []
                                }
                            }
                            .onChange(of: keyword) { newValue in
                                if newValue.count > 0 {
                                    matchedBoardList = boardList.filter {
                                        $0.title.contains(newValue) || $0.content.contains(newValue)
                                    }
                                    
                                    closeButtonMode = .cancel
                                } else {
                                    matchedBoardList = []
                                }
                                
                                if newValue.count == 0 {
                                    matchedBoardList = []
                                    
                                    closeButtonMode = .close
                                }
                            }
                        } else {
                            List(scheduleList) { item in
                                
                            }
                            .onSubmit {
                                if keyword.count > 0 {
                                    matchedScheduleList = scheduleList.filter {
                                        $0.content.contains(keyword)
                                    }
                                    
                                    closeButtonMode = .cancel
                                } else {
                                    matchedScheduleList = []
                                }
                            }
                            .onChange(of: keyword) { newValue in
                                if newValue.count > 0 {
                                    matchedScheduleList = scheduleList.filter {
                                        $0.content.contains(newValue)
                                    }
                                    
                                    closeButtonMode = .cancel
                                } else {
                                    matchedScheduleList = []
                                }
                                
                                if newValue.count == 0 {
                                    matchedScheduleList = []
                                    
                                    closeButtonMode = .close
                                }
                            }
                        }
                }
                .navigationTitle("검색")
                .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
                .background(Color("bkg").ignoresSafeArea())
            }
            
        } else {
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isSearching: .constant(true), boardList: .constant(BoardViewModel(range: 0..<10).boardList), scheduleList: .constant(ScheduleViewModel().scheduleList))
    }
}
