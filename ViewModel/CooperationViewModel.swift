//
//  CooperationService.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/07.
//  

import Foundation
import SwiftUI
import Combine

class CooperationViewModel: ObservableObject {
    static let apiKey = ""
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var cooperationList: [Cooperation]?
    @Published var lastError: String?
    @Published var fetchCompleted = false
    
    let isPreviewViewModel: Bool
    
    //preview용 추천맛집 ViewModel 생성자 사용시 코드 "Cooperation.preview"
    init(preview: Bool = false) {
        isPreviewViewModel = preview
    }
    
    static var preview: CooperationViewModel {
        let viewModel = CooperationViewModel(preview: true)
        viewModel.cooperationList = Cooperation.preview
        
        return viewModel
    }
    
    func fetch(token: String) {
        guard !isPreviewViewModel else {
            fetchCompleted = true
            return
        }
        
        ApiService.fetchCooperations(token: token).receive(on: DispatchQueue.global()).sink { completion in
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
        } receiveValue: { cooperations in
            DispatchQueue.main.async {
                self.cooperationList = cooperations
                self.fetchCompleted = true
            }
        }
        .store(in: &subscriptions)
    }
}
