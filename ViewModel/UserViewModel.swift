//
//  UserService.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/29.
//  사용자 데이터의 기능을 제공해주기 위한 view model

import Foundation
import Combine

class UserViewModel: ObservableObject {
    static let apiKey = ""
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var currentUser: User?
    @Published var lastError: String?
    @Published var fetchCompleted = false
    
    let isPreviewViewModel: Bool
    public private(set) var inputId: String = ""
    public private(set) var inputPassword: String = ""
    
    init(preview: Bool = false) {
        isPreviewViewModel = preview
    }
    
    static var preview: UserViewModel {
//        let serverId = "HayunKwon"
//        let serverPassword = "8642"
        let viewModel = UserViewModel(preview: true)
        
        viewModel.inputId = "HayunKwon"
        viewModel.inputPassword = "8642"
        
        if viewModel.inputId == "HayunKwon" && viewModel.inputPassword == "8642" {
            viewModel.currentUser = User.preview
        } else {
            viewModel.currentUser = User(userId: "알수없음", userName: "알수없음", gender: "알수없음", studentId: "알수없음", major: "알수없음", generation: "알수없음", phone: "알수없음", birthday: "알수없음", password: "알수없음", auth: "알수없음")
        }
        
        return viewModel
    }
    
    func fetch() {
        guard !isPreviewViewModel else {
            return
        }
        
        do {
            try ApiService.fetchUser().sink { completion in
                switch completion {
                    case .failure(let error):
                        print("sink fail!! - \(error)")
                    case .finished:
                        print("sink finished")
                }
            } receiveValue: { user in
                DispatchQueue.main.async {
                    self.currentUser = user
                    self.fetchCompleted = true
                }
            }
            .store(in: &subscriptions)
            
        } catch ApiError.invalidUrl {
            lastError = "잘못된 URL"
        } catch ApiError.failed(let statusCode) {
            lastError = "네트워크 응답 오류(\(statusCode)"
        } catch ApiError.invalidResponse {
            lastError = "네트워크 응답 없음"
        } catch {
            lastError = "알 수 없는 오류 발생"
        }
    }
}
