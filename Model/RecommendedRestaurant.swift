//
//  Restaurant.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/03.
//

import Foundation
import SwiftUI

class RecommendedRestaurant: Identifiable, ObservableObject {
    let id: UUID
    
    @Published var writer: String = "동기창"
    @Published var title: String
    @Published var category: String
    @Published var content: String
    @Published var location: String
    @Published var phone: String
    @Published var operatingTime: String
    @Published var menu: Array<(String, String)>
    
    init(writer: String, title: String, category: String, content: String, location: String, phone: String, operatingTime: String, menu: Array<(String, String)>) {
        id = UUID()
        self.writer = writer
        self.title = title
        self.category = category
        self.content = content
        self.location = location
        self.phone = phone
        self.operatingTime = operatingTime
        self.menu = menu
    }
    
}
