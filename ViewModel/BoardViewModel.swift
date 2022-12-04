//
//  BoardService.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/27.
//  게시판 데이터의 기능을 제공해주기 위한 view model

import Foundation
import SwiftUI
import Combine

class BoardViewModel:  ObservableObject {
    static let apiKey = ""
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var boardList: [Board]?
    @Published var lastError: String?
    @Published var fetchCompleted = false
    
    let isPreviewViewModel: Bool
    
    //preview용 게시판 ViewModel 생성자 사용시 코드 "BoardViewModel.preview"
    init(preview: Bool = false) {
        isPreviewViewModel = preview
        
    }
    
    static var preview: BoardViewModel {
        let viewModel = BoardViewModel(preview: true)
        viewModel.boardList = Board.preview
        
        //게시판을 날짜 순으로 정렬
        viewModel.boardList?.sort { lhs, rhs in
            return lhs.createdDate > rhs.modifiedDate ? true : false
        }
        
        return viewModel
    }
    
    func fetch(token: String) {
        guard !isPreviewViewModel else {
            fetchCompleted = true
            return
        }
        
        ApiService.fetchBoards(token: token).sink { completion in
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
        } receiveValue: { boards in
            DispatchQueue.main.async {
                self.boardList = boards
                self.fetchCompleted = true
            }
        }
        .store(in: &subscriptions)

    }
}

