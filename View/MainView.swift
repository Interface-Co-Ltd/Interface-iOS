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
    @State private var isUserDataLoading = true
    @State private var isBoardDataLoading = true
    @State private var isScheduleDataLoading = true
    
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
                    .disabled(isUserDataLoading)
                    .redacted(reason: isUserDataLoading ? .placeholder : [])
                    
                    //게시판 기능
                    NavigationLink {
                        //NoticeView(boardViewModel: $boardViewModel)
                        NoticeView().environmentObject(NoticeViewModel())
                    } label: {
                        //SubNoticeView(boardService: $boardViewModel)
                        SubNoticeView().environmentObject(NoticeViewModel())
                    }
                    .buttonStyle(ScaledButtonStyle())
                    .foregroundColor(.primary)
                    .padding(.vertical, 10)
                    .disabled(isBoardDataLoading)
                    .redacted(reason: isBoardDataLoading ? .placeholder : [])
                    
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
                    .padding(.vertical, 10)
                }
                .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
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
        .overlay(Color.black.opacity(isSearching ? 0.8 : 0))
        .scaleEffect(isSearching ? 0.9 : 1)
        .onAppear() {
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
