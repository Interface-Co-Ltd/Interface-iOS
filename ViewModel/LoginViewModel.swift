//
//  LoginViewModel.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/27.
//

import Foundation
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    var studentID: String = ""
    var password: String = ""
    let isPreviewViewModel: Bool
    
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var isAuthenticated: Bool = false
    @Published var lastError: String?
    
    @AppStorage("token") var token: String = ""
    
    init(preview: Bool = false) {
        isPreviewViewModel = preview
        
    }
    
    static var preview: LoginViewModel {
        let viewModel = LoginViewModel(preview: true)
        viewModel.isAuthenticated = true
        viewModel.token = ""
        
        //게시판을 날짜 순으로 정렬
        
        return viewModel
    }
    
    func login() {
        guard !isPreviewViewModel else {
            self.isAuthenticated = true
            
            return
        }
        
        ApiService.fetchLogin(studentID: studentID, password: password).sink { completion in
            switch completion {
                case .failure(let error):
                    switch error {
                        case .invalidUrl(_):
                            self.lastError = "잘못된 URL"
                            break
                        case .invalidCredentials:
                            self.lastError = "아이디 또는 비밀번호가 틀렸습니다."
                            break
                        default:
                            self.lastError = "알 수 없는 오류 발생"
                            break
                    }
                case .finished:
                    print("sink finished")
            }
        } receiveValue: { loginResponse in
            guard let token = loginResponse.token else {
                DispatchQueue.main.async {
                    self.lastError = "서버 접근 권한이 없습니다."
                }
                return
            }
            
            guard let statusCode = loginResponse.statusCode, statusCode != 400 else {
                DispatchQueue.main.async {
                    self.lastError = "서버 접근 권한이 없습니다."
                }
                
                return
            }
            
            guard let _ = loginResponse.msg else {
                DispatchQueue.main.async {
                    self.lastError = "서버 접근 권한이 없습니다."
                }
                
                return
            }
            
            DispatchQueue.main.async {
                self.token = token
                self.isAuthenticated = true
            }
        }.store(in: &subscriptions)

        
//        ApiService.login(studentID: studentID, password: password) { result in
//            switch result {
//                case .success(let token):
//                    self.token = token
//
//                    DispatchQueue.main.async {
//                        self.isAuthenticated = true
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//            }
//        }
    }
    
    func logout() {
        guard !isPreviewViewModel else {
            isAuthenticated = false
            
            return
        }
        token = ""
        
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
    }
}
