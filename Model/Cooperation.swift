//
//  Cooperation.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/07.
//

import Foundation

struct Cooperation: Codable, Identifiable {
    var id = UUID()
    
    let cooperationName: String
    let cooperationLink: URL?
    let createdDate: Date
    let modifiedDate: Date
    
    init(cooperationName: String, cooperationLink: URL?, createdDate: String, modifiedDate: String) {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy/MM/dd"
        
        self.cooperationName = cooperationName
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

//preview용 추천맛집 모델 리스트 생성자 사용시 코드 "Cooperation.preview"
extension Cooperation {
    static var preview: [Cooperation] {
        var cooperationList: [Cooperation] = []
        
        cooperationList.append(Cooperation(cooperationName: "이유진", cooperationLink: URL(string: "https://naver.me/FxXkdUiC"), createdDate: "22/11/16", modifiedDate: "22/11/16"))
        cooperationList.append(Cooperation(cooperationName: "공민성", cooperationLink: URL(string: "https://m.place.naver.com/my/place/detailList/d4d3e1a444664b69a58548af8d5b8c1b?close"), createdDate: "22/11/16", modifiedDate: "22/11/16"))
        
        return cooperationList
    }
}
