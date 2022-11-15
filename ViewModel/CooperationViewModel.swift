//
//  CooperationService.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/07.
//  

import Foundation
import SwiftUI

class CooperationViewModel: ObservableObject {
    static let apiKey = ""
    
    @Published var cooperationList: [Cooperation]?
    
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
    }
}
