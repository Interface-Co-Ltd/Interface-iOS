//
//  MainTabView.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Group {
                MainView()
                    .tabItem {
                        Label("메인", systemImage: "house")
                    }
                
                //커뮤니티 탭, 추후 지원
//                CommunityView()
//                    .tabItem {
//                        Label("커뮤티니", systemImage: "person.2")
//                    }
                
                //알림내역 탭, 만들면 주석 해제 ㄱ
//                NotificationHistoryView()
//                    .tabItem {
//                        Label("알림내역", systemImage: "bell")
//                    }
                
                //설정 탭, 만들면 주석 해제 ㄱ
                MenuView()
                    .tabItem {
                        if #available(iOS 15.0, *) {
                            Label("메뉴", systemImage: "line.3.horizontal")
                        } else {
                            Label("메뉴", systemImage: "list.bullet")
                        }
                    }
            }
            .modifier(VersionedTabBarColorModifier(color: Color("bkg")))
        }
    }  
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(BoardViewModel.preview)
            .environmentObject(UserViewModel.preview)
            .environmentObject(ScheduleViewModel.preview)
    }
}
