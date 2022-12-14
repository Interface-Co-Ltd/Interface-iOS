//
//  Notication.swift
//  InterfaceCoLtd
//
//  Created by κΉλν on 2022/11/27.
//

import Foundation

struct Notification: Identifiable {
    var id = UUID()
    
    var title: String
    var content: String
    var pushData: Date
}
