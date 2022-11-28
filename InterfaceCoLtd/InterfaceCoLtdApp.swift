//
//  InterfaceCoLtdApp.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/03.
//

import SwiftUI

@main
struct InterfaceCoLtdApp: App {
    @StateObject var boardViewModel = BoardViewModel.preview
    @StateObject var userViewModel = UserViewModel.preview
    @StateObject var scheduleViewModel = ScheduleViewModel.preview
    @StateObject var cooperationViewModel = CooperationViewModel.preview
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(boardViewModel)
                .environmentObject(userViewModel)
                .environmentObject(scheduleViewModel)
                .environmentObject(cooperationViewModel)
        }
    }
}
