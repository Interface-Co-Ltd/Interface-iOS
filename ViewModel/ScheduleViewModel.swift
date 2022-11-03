//
//  ScheduleService.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/03.
//  일정 데이터의 기능을 제공해주기 위한 view model

import Foundation
import SwiftUI

class ScheduleViewModel: ObservableObject {
    @Published var schedule: [Schedule] = []
    @Published var subViewSchdules: [Schedule] = []
    
    init() {
        schedule.append(Schedule(content: "개강총회", startDate: "22/09/02", endDate: "22/09/02", place: "센B116", allDay: true, scheduleType: "인터페이스"))
        
        schedule.append(Schedule(content: "회비납부 마감", startDate: "22/09/30", endDate: "22/09/30", place: "없음", allDay: true, scheduleType: "인터페이스"))
        
        schedule.append(Schedule(content: "안수경 아이폰 언박싱", startDate: "22/10/07", endDate: "22/10/07", place: "동아리방", allDay: false, scheduleType: "인터페이스"))
        
        schedule.append(Schedule(content: "중간고사", startDate: "22/10/20", endDate: "22/10/26", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        schedule.append(Schedule(content: "할로윈 행사", startDate: "22/10/31", endDate: "22/10/31", place: "없음", allDay: true, scheduleType: "인터페이스"))
        
        schedule.append(Schedule(content: "중간고사 성적열람 및 정정", startDate: "22/11/01", endDate: "22/11/06", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        schedule.append(Schedule(content: "학생예비군", startDate: "22/11/01", endDate: "22/11/04", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
//        schedule.append(Schedule(content: "축제", startDate: "22/11/02", endDate: "22/11/04", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        schedule.append(Schedule(content: "계절학기 수강신청", startDate: "22/12/01", endDate: "22/12/05", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        schedule.append(Schedule(content: "기말고사", startDate: "22/12/15", endDate: "22/12/21", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        schedule.append(Schedule(content: "기말고사 성적열람 및 정정", startDate: "22/12/27", endDate: "23/01/01", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        schedule.append(Schedule(content: "기말고사 성적마감", startDate: "23/01/02", endDate: "23/01/03", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        self.subViewSchdules = self.schedule
        
        //iOS 버전 분기
        if #available(iOS 15, *) {
            subViewSchdules = subViewSchdules.filter {
                $0.endDate.addingTimeInterval(3600 * 24) > .now && $0.startDate.timeIntervalSinceNow < TimeInterval(3600 * 24 * 7)
            }
        } else {
            subViewSchdules = subViewSchdules.filter {
                $0.endDate.addingTimeInterval(3600 * 24) > NSDate.now as Date && $0.startDate.timeIntervalSinceNow < TimeInterval(3600 * 24 * 7)
            }
        }
    }
}
