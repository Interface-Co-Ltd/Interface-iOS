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
        viewModel.boardList = (0..<10).map({ _ in
            Board.preview
        })
        
        //게시판을 날짜 순으로 정렬
        viewModel.boardList?.sort { lhs, rhs in
            return lhs.createdDate > rhs.modifiedDate ? true : false
        }
        
        return viewModel
    }
    
    func fetch() {
        guard !isPreviewViewModel else {
            return
        }
        
        do {
            try ApiService.fetchBoards().sink { completion in
                switch completion {
                    case .failure(let error):
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
