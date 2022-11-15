//
//  BoardService.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/27.
//  게시판 데이터의 기능을 제공해주기 위한 view model

import Foundation
class BoardViewModel:  ObservableObject {
    static let apiKey = ""
    
    @Published var boardList: [Board]?
    @Published var lastError: String?
//    @Published var filteredBoardList: [Board] = []
    
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
    }
    
    //검색기능(보류)
//    func filterBoardList(searchhKeyword: String){
//        if searchhKeyword == "" {
//            filteredBoardList = []
//        } else {
//            filteredBoardList = self.boardList.filter {
//                $0.title.localizedCaseInsensitiveContains(searchhKeyword) || $0.content.localizedCaseInsensitiveContains(searchhKeyword) || $0.userID.localizedCaseInsensitiveContains(searchhKeyword)
//            }
//        }
//    }
}
