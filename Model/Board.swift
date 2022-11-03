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
    
    //게시판 생성 날짜를 "22/11/03 오후 20:13"형태의 문자열로 반환
    func stringCreatedDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy/MM/dd a hh:mm"
        
        return formatter.string(from: self.createdDate)
    }
    
    //게시판 수정 날짜를 "22/11/03 오후 20:13"형태의 문자열로 반환
    func stringModifiedDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy/MM/dd a hh:mm"
        
        return formatter.string(from: self.modifiedDate)
    }
}
