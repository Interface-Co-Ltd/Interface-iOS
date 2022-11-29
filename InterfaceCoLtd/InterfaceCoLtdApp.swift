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
    @StateObject var scheduleViewModel = ScheduleViewModel()
    @StateObject var cooperationViewModel = CooperationViewModel.preview
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject var networkManager = NetworkManager()
    
    @AppStorage("autoLogin") private var autoLogin: Bool = false
    @AppStorage("showLoginView") var showLoginView: Bool = true
    
//    @State var notifications: [Notification]
    
    var body: some Scene {
        WindowGroup {
            if showLoginView {
                LoginView(autoLogin: $autoLogin, showLoginView: $showLoginView)
                    .environmentObject(loginViewModel)
                    .modifier(VersionedNetworkDisconnetedAlert(isConnected: $networkManager.isConnected))
                    .onAppear() {
                        loginViewModel.fcmToken = delegate.fcmToken
                    }
            } else {
                MainTabView(delegate: delegate, displayStyle: $displayStyle, showLoginView: $showLoginView)
                    .environmentObject(boardViewModel)
                    .environmentObject(userViewModel)
                    .environmentObject(scheduleViewModel)
                    .environmentObject(cooperationViewModel)
                    .environmentObject(loginViewModel)
                    .onAppear() {
                        UIApplication.shared.windows.forEach { window in
                            window.overrideUserInterfaceStyle = displayStyle
                        }
                        print("token : \(loginViewModel.token)")
                        scheduleViewModel.fetch(token: loginViewModel.token)
                    }
                    .modifier(VersionedNetworkDisconnetedAlert(isConnected: $networkManager.isConnected))
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .modifier(DynamicIslandNotificationModifier())
            }
        }
        
    }
}

extension UIApplication {
    var deviceName: String {
        return UIDevice.current.name
    }
    
    var haveDynamicIsland: Bool {
       return deviceName == "iPhone 14 Pro" || deviceName == "iPhone 14 Pro Max"
    }
}

