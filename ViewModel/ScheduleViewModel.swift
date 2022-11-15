//
//  ScheduleService.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/03.
//  일정 데이터의 기능을 제공해주기 위한 view model

import Foundation
import SwiftUI

class ScheduleViewModel: ObservableObject {
    static let apiKey = ""
    
    @Published var scheduleList: [Schedule]?
    @Published var subViewSchdules: [Schedule] = []
    
    let isPreviewViewModel: Bool
    
    //preview용 일정 ViewModel 생성자 사용시 코드 "ScheduleViewModel.preview"
    init(preview: Bool = false) {
        isPreviewViewModel = preview
    }
    
    static var preview: ScheduleViewModel {
        let viewModel = ScheduleViewModel(preview: true)
        viewModel.scheduleList = Schedule.preview
        
        //iOS 버전 분기
        if let schedules = viewModel.scheduleList {
            viewModel.subViewSchdules = schedules
        }
        
        if #available(iOS 15, *) {
            viewModel.subViewSchdules = viewModel.subViewSchdules.filter {
                $0.endDate.addingTimeInterval(3600 * 24) > .now && $0.startDate.timeIntervalSinceNow < TimeInterval(3600 * 24 * 7)
            }
        } else {
            viewModel.subViewSchdules = viewModel.subViewSchdules.filter {
                $0.endDate.addingTimeInterval(3600 * 24) > NSDate.now as Date && $0.startDate.timeIntervalSinceNow < TimeInterval(3600 * 24 * 7)
            }
        }
        
        return viewModel
    }
    
    func fetch() {
        guard !isPreviewViewModel else {
            return
        }
    }
}
