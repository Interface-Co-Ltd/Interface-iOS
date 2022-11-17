//
//  CodableSchedule.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/15.
//

import Foundation

struct CodableSchedule: Codable {
    var id = UUID()
    
    let div: String
    let content: String
    let startDate: Date
    let endDate: Date
    let place: String
    let allDay: Bool
}
