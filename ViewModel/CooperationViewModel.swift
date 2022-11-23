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
    
    func fetch() {
        guard !isPreviewViewModel else {
            return
        }
        
        do {
            try ApiService.fetchCooperations().sink { completion in
                switch completion {
                    case .failure(let error):
                        print("sink fail!! - \(error)")
                    case .finished:
                        print("sink finished")
                }
            } receiveValue: { cooperations in
                self.cooperationList = cooperations
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
