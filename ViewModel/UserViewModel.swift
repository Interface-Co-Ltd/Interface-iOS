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
    
    init(preview: Bool = false) {
        isPreviewViewModel = preview
    }
    
    static var preview: UserViewModel {
        let viewModel = UserViewModel(preview: true)
        
        viewModel.currentUser = User.preview
        
        return viewModel
    }
    
    func fetch(token: String, studentId: String) {
        guard !isPreviewViewModel else {
            fetchCompleted = true
            return
        }
        
        ApiService.fetchUser(token: token, studentId: studentId).sink { completion in
            switch completion {
                case .failure(let error):
                    switch error {
                        case .invalidUrl(_):
                            DispatchQueue.main.async {
                                self.lastError = "잘못된 URL"
                            }
                            break
                        case .failed(let statusCode):
                            DispatchQueue.main.async {
                                self.lastError = "네트워크 응답 오류(\(statusCode)"
                            }
                            break
                        case .invalidResponse:
                            DispatchQueue.main.async {
                                self.lastError = "네트워크 응답 없음"
                            }
                            break
                        default:
                            DispatchQueue.main.async {
                                self.lastError = "알 수 없는 오류 발생"
                            }
                            break
                    }
                    print("sink fail!! - \(error)")
                case .finished:
                    print("sink finished")
            }
        } receiveValue: { users in
            DispatchQueue.main.async {
                self.currentUser = users
                self.fetchCompleted = true
            }
        }
        .store(in: &subscriptions)
    }
}
