//
//  NotificationValue.swift
//  InterfaceCoLtd
//
//  Created by κΉλν on 2022/11/29.
//

import SwiftUI
import UserNotifications

struct NotificationValue: Identifiable {
    var id: String = UUID().uuidString
    var content: UNNotificationContent
    var dateCreated: Date = Date()
    var showNotification: Bool = false
}
