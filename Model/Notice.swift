//
//  Notice.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//

import Foundation
import SwiftUI

class Notice: Identifiable, ObservableObject {
    let id: UUID
    let writer: String = "동기창"
    
    @Published var title: String
    @Published var content: String
    
    let insertDate: Date
    
    init(title: String, content: String, insertDate: Date = Date()) {
        id = UUID()
        self.title = title
        self.content = content
        self.insertDate = insertDate
    }
    
}
