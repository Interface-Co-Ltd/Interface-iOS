//
//  Notication.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/27.
//

import Foundation

struct Notification: Identifiable {
    var id = UUID()
    
    var title: String
    var content: String
    var pushData: Date
}
