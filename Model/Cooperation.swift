//
//  Cooperation.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/07.
//

import Foundation

struct Cooperation: Codable, Identifiable {
    let id = UUID()
    var favorites: [UUID: Bool]?
    var favoriteCount: Int?
    
    let name: String
    let link: String
    let address: String
    
//    init(cooperationName: String, cooperationLink: URL?, createdDate: String, modifiedDate: String) {
//        self.favoriteCount = 0
//
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "ko_KR")
//        formatter.dateFormat = "yy/MM/dd"
//
//        self.name = cooperationName
//        self.link = cooperationLink
//
//        if let date = formatter.date(from: createdDate) {
//            self.createdDate = date
//        } else {
//            if #available(iOS 15, *) {
//                self.createdDate = .now
//            } else {
//                self.createdDate = NSDate.now as Date
//            }
//        }
//
//        if let date = formatter.date(from: modifiedDate) {
//            self.modifiedDate = date
//        } else {
//            if #available(iOS 15, *) {
//                self.modifiedDate = .now
//            } else {
//                self.modifiedDate = NSDate.now as Date
//            }
//        }
//    }
}

//preview용 추천맛집 모델 리스트 생성자 사용시 코드 "Cooperation.preview"
extension Cooperation {
    static var preview: [Cooperation] {
        var cooperationList: [Cooperation] = []
        
        cooperationList.append(Cooperation(name: "이유진", link: "https://naver.me/FxXkdUiC", address: ""))
        cooperationList.append(Cooperation(name: "공민성", link: "https://m.place.naver.com/my/place/detailList/d4d3e1a444664b69a58548af8d5b8c1b?close", address: ""))
        
        return cooperationList
    }
}
