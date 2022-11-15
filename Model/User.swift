//
//  User.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/29.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    
    let userId: String
    let userName: String
    let gender: String
    let studentId: String
    let major: String
    let generation: String
    let phone: String
    let birthday: String
    let password: String
    let auth: String
    
    init(userId: String, userName: String, gender: String, studentId: String, major: String, generation: String, phone: String, birthday: String, password: String, auth: String) {
        self.userId = userId
        self.userName = userName
        self.gender = gender
        self.studentId = studentId
        self.major = major
        self.generation = generation
        self.phone = phone
        self.birthday = birthday
        self.password = password
        self.auth = auth
    }
}

//preview용 사용자 모델 생성자 사용시 코드 "User.preview"
extension User {
    static var preview: User {
        return User(userId: "HayunKwon", userName: "권하윤", gender: "male", studentId: "19010769", major: "전자정보통신공학과", generation: "32", phone: "01094570043", birthday: "980809", password: "1234", auth: "회장")
    }
}
