//
//  InterfaceCoLtdApp.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/03.
//

import SwiftUI

@main
struct InterfaceCoLtdApp: App {
    @StateObject var boardViewModel = BoardViewModel(range: 0..<10)
    @StateObject var userViewModel = UserViewModel(serverId: "ddonguri", serverPassword: "1234")
    @StateObject var scheduleViewModel = ScheduleViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(boardViewModel)
                .environmentObject(userViewModel)
                .environmentObject(scheduleViewModel)
        }
    }
}
