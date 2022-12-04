//
//  User.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/29.
//

import Foundation

struct User: Codable {
    let studentId: String
    let name: String
    let email: String
    let auth: String
    let phone: String
    let birthday: String
}

//preview용 사용자 모델 생성자 사용시 코드 "User.preview"
extension User {
    static var preview: User {
        var data = User(studentId: "", name: "", email: "", auth: "", phone: "", birthday: "")
        
        do {
            guard let jsonData = PreviewUser.data.data(using: .utf8) else {
                fatalError()
            }
            
            data = try JSONDecoder().decode(User.self, from: jsonData)
        } catch {
            print("유저 미리보기 데이터 디코딩 실패")
        }
        
        
        return data
    }
    
}
