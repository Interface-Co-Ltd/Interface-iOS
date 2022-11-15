//
//  UserService.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/29.
//  사용자 데이터의 기능을 제공해주기 위한 view model

import Foundation

class UserViewModel: ObservableObject {
    static let apiKey = ""
    
    @Published var currentUser: User?
    
    let isPreviewViewModel: Bool
    public private(set) var inputId: String = ""
    public private(set) var inputPassword: String = ""
    
    init(preview: Bool = false) {
        isPreviewViewModel = preview
    }
    
    static var preview: UserViewModel {
        let serverId = "HayunKwon"
        let serverPassword = "8642"
        let viewModel = UserViewModel(preview: true)
        
        if viewModel.inputId == serverId && viewModel.inputPassword == serverPassword {
            viewModel.currentUser = User.preview
        } else {
            viewModel.currentUser = User(userId: "알수없음", userName: "알수없음", gender: "알수없음", studentId: "알수없음", major: "알수없음", generation: "알수없음", phone: "알수없음", birthday: "알수없음", password: "알수없음", auth: "알수없음")
        }
        
        return viewModel
    }
}
