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
    
    var fcmToken: String = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
   
    @Published var lastError: String?
    
    @AppStorage("token") var token: String = ""
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
    
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
        
        ApiService.fetchLogin(studentID: studentID, password: password, fcmToken: fcmToken).sink { completion in
            switch completion {
                case .failure(let error):
                    switch error {
                        case .invalidUrl(_):
                            DispatchQueue.main.async {
                                self.lastError = "잘못된 URL"
                            }
                            break
                        case .invalidCredentials:
                            DispatchQueue.main.async {
                                withAnimation(.easeInOut) {
                                    self.lastError = "아이디 또는 비밀번호가 틀렸습니다."
                                }
                            }
                            break
                        default:
                            DispatchQueue.main.async {
                                self.lastError = "알 수 없는 오류 발생"
                            }
                            break
                    }
                case .finished:
                    print("sink finished")
                    
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        print(self.isAuthenticated)
                        print("loginvViewModelfcmToken: \(self.fcmToken)")
                    }
                    
                    
            }
        } receiveValue: { loginResponse in
            guard let token = loginResponse.token else {
                DispatchQueue.main.async {
                    self.lastError = "서버 접근 권한이 없습니다."
                }
                return
            }
            
            print("token : \(token)")
            
            DispatchQueue.main.async {
                self.token = token
            }
            
            guard let _ = loginResponse.statusCode else {
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
            
            
        }.store(in: &subscriptions)
        
        if let error = lastError {
            print(error)
        }
    }
    
//    func logout() {
//        token = ""
//        
//        self.isAuthenticated = false
//        
//        print(isAuthenticated)
//    }
}
