//
//  Cooperation.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/07.
//

import Foundation

struct Cooperation: Identifiable {
    var id = UUID()
    
    let cooperationName: String
    let cooperationAddress: String
    let cooperationLink: URL?
    let createdDate: Date
    let modifiedDate: Date
    
    init(cooperationName: String, cooperationAddress: String, cooperationLink: URL?, createdDate: String, modifiedDate: String) {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy/MM/dd"
        
        self.cooperationName = cooperationName
        self.cooperationAddress = cooperationAddress
        self.cooperationLink = cooperationLink
        
        if let date = formatter.date(from: createdDate) {
            self.createdDate = date
        } else {
            if #available(iOS 15, *) {
                self.createdDate = .now
            } else {
                self.createdDate = NSDate.now as Date
            }
        }
        
        if let date = formatter.date(from: modifiedDate) {
            self.modifiedDate = date
        } else {
            if #available(iOS 15, *) {
                self.modifiedDate = .now
            } else {
                self.modifiedDate = NSDate.now as Date
            }
        }
    }
}
