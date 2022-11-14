//
//  MainView.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/14.
//

import SwiftUI

struct MainView: View {
    @State private var showIDCard = false
    @State private var isSearching = false
    
    @State private var boardViewModel = BoardViewModel(range: 0..<10)
    @State private var userViewModel = UserViewModel(serverId: "ddonguri", serverPassword: "1234")
    @State private var scheduleViewModel = ScheduleViewModel()
    
    private let columns = [
        GridItem(.adaptive(minimum: 350, maximum: .infinity), spacing: nil, alignment: .top)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    //신분증 기능, 만들면 주석 해제 ㄱ
//                    Button {
//                        showIDCard.toggle()
//                    } label: {
//                        SubIDCardView(user: $userViewModel.currentUser)
//                    }
//                    .buttonStyle(ScaledButtonStyle())
//                    .foregroundColor(.primary)
//                    .padding(.top)
//                    .padding(.bottom, 10)
//                    .padding(.vertical)
                    
                    //게시판 기능
                    NavigationLink {
                        //NoticeView(boardViewModel: $boardViewModel)
                        NoticeView().environmentObject(NoticeModel())
                    } label: {
                        //SubNoticeView(boardService: $boardViewModel)
                        SubNoticeView().environmentObject(NoticeModel())
                    }
                    .buttonStyle(ScaledButtonStyle())
                    .foregroundColor(.primary)
                    .padding(.vertical, 10)
                    
                    NavigationLink {
                        InformationWithSelectionView(schedule: scheduleViewModel.scheduleList)
                    } label: {
                        SubCalendarView(schedule: $scheduleViewModel.subViewSchdules)
                    }
                    .foregroundColor(.primary)
                    .buttonStyle(ScaledButtonStyle())
                    .padding(.vertical, 10)
                    
                    //추천 맛집 기능
                    NavigationLink {
                        RecommendedRestaurantView()
                            .environmentObject(RecommendedRestaurantModel())
                    } label: {
                        SubRecommendedRestaurantView()
                    }
                    .buttonStyle(ScaledButtonStyle())
                    .foregroundColor(.primary)
                    .padding(.vertical)
                }
                .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            withAnimation(.easeInOut) {
                                isSearching = true
                            }
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                        .buttonStyle(ScaledButtonStyle())
                    }
                }
            }
            .navigationTitle("인터페이스")
            .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
            .background(Color("bkg").ignoresSafeArea())
        }
        .fullScreenCover(isPresented: $isSearching) {
            SearchView(isSearching: $isSearching, boardList: $boardViewModel.boardList, scheduleList: $scheduleViewModel.scheduleList)
        }
        //신분증 시트, 만들면 주석 해제 ㄱ
//        .sheet(isPresented: $showIDCard) {
//            IDCardView(user: $userViewModel.currentUser)
//        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
