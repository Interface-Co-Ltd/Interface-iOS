//
//  InterfaceCoLtdApp.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/03.
//

import SwiftUI
import FirebaseCore

@main
struct InterfaceCoLtdApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @AppStorage("displayMode") private var displayStyle = UIUserInterfaceStyle.unspecified
        
    @StateObject var boardViewModel = BoardViewModel.preview
    @StateObject var userViewModel = UserViewModel.preview
    @StateObject var scheduleViewModel = ScheduleViewModel.preview
    
    @AppStorage("autoLogin") private var autoLogin: Bool = false
    
    @State private var showLoginView = true
    
    var body: some Scene {
        WindowGroup {
            if showLoginView {
                LoginView(autoLogin: $autoLogin, showLoginView: $showLoginView)
            } else {
                MainTabView(delegate: delegate, displayStyle: $displayStyle)
                    .environmentObject(boardViewModel)
                    .environmentObject(userViewModel)
                    .environmentObject(scheduleViewModel)
                    .onAppear() {
                        UIApplication.shared.windows.forEach { window in
                            window.overrideUserInterfaceStyle = displayStyle
                        }
                    }
            }
        }
        
    }
}

