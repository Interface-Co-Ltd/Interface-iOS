//
//  InterfaceCoLtdApp.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/03.
//

import SwiftUI

@main
struct InterfaceCoLtdApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(BoardViewModel(range: 0..<10))
                .environmentObject(UserViewModel(serverId: "ddonguri", serverPassword: "1234"))
                .environmentObject(ScheduleViewModel())
        }
    }
}
