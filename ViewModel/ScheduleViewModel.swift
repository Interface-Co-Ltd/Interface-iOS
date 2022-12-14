//
//  ScheduleService.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/03.
//  일정 데이터의 기능을 제공해주기 위한 view model

import Foundation
import SwiftUI
import Combine

class ScheduleViewModel: ObservableObject {
    static let apiKey = ""
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var scheduleList: [Schedule]?
    @Published var subViewSchdules: [Schedule] = []
    @Published var lastError: String?
    @Published var fetchCompleted = false
    
    let isPreviewViewModel: Bool
    
//    @Published var noneDateScheduleList: [NoneDateSchedule]?
//    @Published var subViewNoneDateSchedules: [NoneDateSchedule] = []
    
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
    
    func fetch(token: String) {
        guard !isPreviewViewModel else {
            return
        }
        
//        ApiService.fetchNoneDateSchedules(token: token).sink { completion in
//            switch completion {
//                case .failure(let error):
//                    switch error {
//                        case .invalidUrl(_):
//                            DispatchQueue.main.async {
//                                self.lastError = "잘못된 URL"
//                                if let error = self.lastError {
//                                    print(error)
//                                }
//                            }
//                            break
//                        case .failed(let statusCode):
//                            DispatchQueue.main.async {
//                                self.lastError = "네트워크 응답 오류(\(statusCode)"
//                                if let error = self.lastError {
//                                    print(error)
//                                }
//                            }
//                            break
//                        case .invalidResponse:
//                            DispatchQueue.main.async {
//                                self.lastError = "네트워크 응답 없음"
//                                if let error = self.lastError {
//                                    print(error)
//                                }
//                            }
//                            break
//                        default:
//                            DispatchQueue.main.async {
//                                self.lastError = "알 수 없는 오류 발생"
//                                if let error = self.lastError {
//                                    print(error)
//                                }
//                            }
//                            break
//                    }
//                    print("sink fail!! - \(error.localizedDescription)")
//                case .finished:
//                    print("sink finished")
//            }
//        } receiveValue: { schedules in
//            DispatchQueue.main.async {
//                self.noneDateScheduleList = schedules
//                self.fetchCompleted = true
//                
//                if let schedules = self.noneDateScheduleList {
//                    self.subViewNoneDateSchedules = schedules
//                    
//                    if #available(iOS 15, *) {
//                        self.subViewNoneDateSchedules = self.subViewNoneDateSchedules.filter {
//                            $0.getEndDate().addingTimeInterval(3600 * 24) > .now && $0.getStartDate().timeIntervalSinceNow < TimeInterval(3600 * 24 * 7)
//                        }
//                    } else {
//                        self.subViewNoneDateSchedules = self.subViewNoneDateSchedules.filter {
//                            $0.getEndDate().addingTimeInterval(3600 * 24) > NSDate.now as Date && $0.getStartDate().timeIntervalSinceNow < TimeInterval(3600 * 24 * 7)
//                        }
//                    }
//                }
//            }
//        }.store(in: &subscriptions)
//
//        print(lastError ?? "")
        
        ApiService.fetchSchedules(token: token).sink { completion in
            switch completion {
                case .failure(let error):
                    switch error {
                        case .invalidUrl(_):
                            DispatchQueue.main.async {
                                self.lastError = "잘못된 URL"
                                if let error = self.lastError {
                                    print(error)
                                }
                            }
                            break
                        case .failed(let statusCode):
                            DispatchQueue.main.async {
                                self.lastError = "네트워크 응답 오류(\(statusCode)"
                                if let error = self.lastError {
                                    print(error)
                                }
                            }
                            break
                        case .invalidResponse:
                            DispatchQueue.main.async {
                                self.lastError = "네트워크 응답 없음"
                                if let error = self.lastError {
                                    print(error)
                                }
                            }
                            break
                        default:
                            DispatchQueue.main.async {
                                self.lastError = "알 수 없는 오류 발생"
                                if let error = self.lastError {
                                    print(error)
                                }
                            }
                            break
                    }
                    print("sink fail!! - \(error.localizedDescription)")
                case .finished:
                    print("sink finished")
            }
        } receiveValue: { schedules in
            DispatchQueue.main.async {
                self.scheduleList = schedules
                
                if let schedules = self.scheduleList {
                    self.subViewSchdules = schedules
                    
                    if #available(iOS 15, *) {
                        self.subViewSchdules = self.subViewSchdules.filter {
                            $0.endDate.addingTimeInterval(3600 * 24) > .now && $0.startDate.timeIntervalSinceNow < TimeInterval(3600 * 24 * 7)
                        }
                    } else {
                        self.subViewSchdules = self.subViewSchdules.filter {
                            $0.endDate.addingTimeInterval(3600 * 24) > NSDate.now as Date && $0.startDate.timeIntervalSinceNow < TimeInterval(3600 * 24 * 7)
                        }
                    }
                }
                
                self.fetchCompleted = true
            }
        }.store(in: &subscriptions)

        print(lastError ?? "")
        
        
    }
}
