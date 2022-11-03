//
//  Board.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/27.
//

import Foundation

struct Board: Identifiable {
    var id = UUID()
    
    let title: String
    var content: String
    let createdDate: Date
    let modifiedDate: Date
    let userID: String
    
    func stringCreatedDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy/MM/dd a hh:mm"
        
        return formatter.string(from: self.createdDate)
    }
    
    func stringModifiedDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy/MM/dd a hh:mm"
        
        return formatter.string(from: self.modifiedDate)
    }
}
