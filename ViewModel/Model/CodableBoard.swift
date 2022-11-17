//
//  CodableBoard.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/15.
//

import Foundation

struct CodableBoard: Codable {
    var id = UUID()
    
    let title: String
    var content: String
    let createdDate: Date
    let modifiedDate: Date
    let userID: String
}
