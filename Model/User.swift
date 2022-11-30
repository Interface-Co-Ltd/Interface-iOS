//
//  User.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/29.
//

import Foundation

//struct User: Codable, Identifiable {
//    var id = UUID()
//
//    let userId: String
//    let userName: String
//    let gender: String
//    let studentId: String
//    let major: String
//    let generation: String
//    let phone: String
//    let birthday: String
//    let password: String
//    let auth: String
//
//    init(userId: String, userName: String, gender: String, studentId: String, major: String, generation: String, phone: String, birthday: String, password: String, auth: String) {
//        self.userId = userId
//        self.userName = userName
//        self.gender = gender
//        self.studentId = studentId
//        self.major = major
//        self.generation = generation
//        self.phone = phone
//        self.birthday = birthday
//        self.password = password
//        self.auth = auth
//    }
//}

struct User: Codable {
    let studentId: String
    let name: String
    let email: String
    let auth: String
    let phone: String
    let birthday: String
}

//enum Auth: String, Codable {
//    case roleAdmin = "ROLE_ADMIN"
//}
//
//enum Birthday: String, Codable {
//    case the111111 = "11-11-11"
//    case the222222 = "22-22-22"
//}
//
//enum Name: String, Codable {
//    case interfaceAdmin = "INTERFACE_ADMIN"
//}
//
//enum Phone: String, Codable {
//    case the01011111111 = "010-1111-1111"
//}

//preview용 사용자 모델 생성자 사용시 코드 "User.preview"
extension User {
    static var preview: User {
        return User(studentId: "19010769", name: "권하윤", email: "cupertino98@gmail.com", auth: "ROLE_ADMIN", phone: "010-9457-0043", birthday: "98-03-08")
    }
}
