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
    
    //    @State private var currentTranslation = CGSize.zero
    
    @EnvironmentObject var boardViewModel: BoardViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    
    //    private var dragSearchView: some Gesture {
    //        DragGesture()
    //            .onChanged { value in
    //                withAnimation(.interactiveSpring()) {
    //                    currentTranslation = value.translation
    //                    currentTranslation.width = 0
    //                }
    //            }
    //            .onEnded { value in
    //                withAnimation(.interactiveSpring()) {
    //                    if currentTranslation.height > UIScreen.main.bounds.height / 4 {
    //                        currentTranslation = .zero
    //                        isSearching = false
    //                    } else {
    //                        currentTranslation = .zero
    //                    }
    //                }
    //            }
    //    }
    
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
                    .padding(.bottom,10)
                    .sheet(isPresented: $showIDCard) {
                        IDcardDetailView()
                    }
                    .shadow(radius: 20)
                    
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
                        if let schedules = scheduleViewModel.scheduleList {
                            InformationWithSelectionView(schedule: schedules)
                        }
                    } label: {
                        SubCalendarView()
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
                        .fullScreenCover(isPresented: $isSearching) {
                            withAnimation(.easeInOut) {
                                SearchView(isSearching: $isSearching)
                            }
                            //                .offset(currentTranslation)
                            //                .gesture(dragSearchView)
                        }
                    }
                }
            }
            .navigationTitle("인터페이스")
            .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
            .background(Color("bkg").ignoresSafeArea())
            
        }
        .scaleEffect(isSearching ? 0.9 : 1)
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
