//
//  UserService.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/29.
//  사용자 데이터의 기능을 제공해주기 위한 view model

import Foundation

class UserViewModel: ObservableObject {
    @Published var currentUser: User
    
    init(serverId: String, serverPassword: String) {
        self.inputId = serverId
        self.inputPassword = serverPassword
        
        if self.inputId == serverId && self.inputPassword == serverPassword {
            self.currentUser = User(userId: "ddonguri", userName: "동기창", gender: "male", studentId: "19010769", major: "전자정보통신공학과", generation: "32", phone: "01063004823", birthday: "980809", password: "1234", auth: "회장")
        } else {
            self.currentUser = User(userId: "알수없음", userName: "알수없음", gender: "알수없음", studentId: "알수없음", major: "알수없음", generation: "알수없음", phone: "알수없음", birthday: "알수없음", password: "알수없음", auth: "알수없음")
        }
    }
    
    public private(set) var inputId: String = ""
    public private(set) var inputPassword: String = ""
}
