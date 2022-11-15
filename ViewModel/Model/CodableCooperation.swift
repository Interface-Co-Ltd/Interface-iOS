//
//  CodableCooperation.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/16.
//

import Foundation

struct CodableCooperation: Codable {
    var id = UUID()
    
    let cooperationName: String
    let cooperationLink: URL?
    let createdDate: Date
    let modifiedDate: Date
}
