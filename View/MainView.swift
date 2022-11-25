//
//  MainView.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/14.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var boardViewModel: BoardViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    
    @State private var showIDCard = false
    @State private var isSearching = false
    @State private var isUserDataLoading = true
    @State private var isBoardDataLoading = true
    @State private var isScheduleDataLoading = true
    
    private let columns = [
        GridItem(.adaptive(minimum: 350, maximum: .infinity), spacing: nil, alignment: .top)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    Button{
                        showIDCard.toggle()
                    } label: {
                        SubIDCardView()
                    }
                    .buttonStyle(ScaledButtonStyle())
                    .foregroundColor(.primary)
                    .padding(.top)
                    .padding(.vertical)
                    .padding(.bottom,10)
                    .sheet(isPresented: $showIDCard) {
                        IDcardDetailView()
                    }
                    .shadow(radius: 20)
                    .disabled(isUserDataLoading)
//                    .redacted(reason: isUserDataLoading ? .placeholder : [])
                    
                    //게시판 기능
                    NavigationLink {
                        if let notices = boardViewModel.boardList {
                            NoticeView(store: notices)
                        }
                    } label: {
                        if let notices = boardViewModel.boardList {
                            SubNoticeView(store: notices)
                        }
                        
                    }
                    .buttonStyle(ScaledButtonStyle())
                    .foregroundColor(.primary)
                    .padding(.vertical, 10)
                    .disabled(isBoardDataLoading)
                    .redacted(reason: isBoardDataLoading ? .placeholder : [])
                    
                    //일정 기능
                    NavigationLink {
                        if let schedules = scheduleViewModel.scheduleList {
                            if #available(iOS 15, *) {
                                InformationWithSelectionView(schedule: schedules, currentDate: .now)
                            } else {
                                InformationWithSelectionView(schedule: schedules, currentDate: NSDate.now as Date)
                            }
                        }
                    } label: {
                        SubCalendarView()
                    }
                    .foregroundColor(.primary)
                    .buttonStyle(ScaledButtonStyle())
                    .padding(.vertical, 10)
                    .disabled(isScheduleDataLoading)
                    .redacted(reason: isScheduleDataLoading ? .placeholder : [])
                    
                    //추천 맛집 기능
                    NavigationLink {
                        RecommendedRestaurantUserView()
                    } label: {
                        SubRecommendedRestaurantView()
                    }
                    .buttonStyle(ScaledButtonStyle())
                    .foregroundColor(.primary)
                }
                .padding(.horizontal)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    HStack {
                        if #available(iOS 15.0, *) {
                            Button {
                                withAnimation(.spring()) {
                                    isSearching = true
                                }
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                            }
                            .buttonStyle(ScaledButtonStyle())
                            .fullScreenCover(isPresented: $isSearching) {
                                withAnimation(.easeInOut) {
                                    NavigationView {
                                        SearchView(isSearching: $isSearching)
                                    }
                                }
                            }
                            
                        } else {
                            Spacer()
                            
                            NavigationLink {
                                SearchView(isSearching: $isSearching)
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                            }
                            .buttonStyle(ScaledButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("인터페이스")
            .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
            .background(Color("bkg").ignoresSafeArea())
        }
        .scaleEffect(isSearching ? 0.9 : 1)
        .modifier(VersionedSearchViewTransitionModifier(isSearching: $isSearching))
        .onAppear() {
//            scheduleViewModel.fetch()
            boardViewModel.fetch()
            print("fail \(boardViewModel.lastError ?? "none error")")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isUserDataLoading = false
                isBoardDataLoading = false
                isScheduleDataLoading = false
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(BoardViewModel.preview)
            .environmentObject(UserViewModel.preview)
            .environmentObject(ScheduleViewModel.preview)
    }
}
