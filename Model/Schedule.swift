//
//  Schedule.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/03.
//

import Foundation

struct Schedule: Identifiable {
    enum ScheduleType {
        case interface
        case sejong
    }
    
    var id = UUID()
    
    let scheduleType: ScheduleType
    let content: String
    let startDate: Date
    let endDate: Date
    let place: String
    let allDay: Bool
    
    
    init(content: String, startDate: String, endDate: String, place: String, allDay: Bool, scheduleType: String) {
        
        self.scheduleType = scheduleType == "인터페이스" ? .interface : .sejong
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy/MM/dd"
        
        self.content = content
        
        //일정 시작날짜 초기화
        if let date = formatter.date(from: startDate) {
            self.startDate = date
        } else {
            //iOS 버전 분기
            if #available(iOS 15, *) {
                self.startDate = .now
            } else {
                self.startDate = NSDate.now as Date
            }
        }
        
        //일정 종료날짜 초기화
        if let date = formatter.date(from: endDate) {
            self.endDate = date
        } else {
            //iOS 버전 분기
            if #available(iOS 15, *) {
                self.endDate = .now
            } else {
                self.endDate = NSDate.now as Date
            }
        }
        
        self.place = place
        self.allDay = allDay
    }
    
    //해당 일정의 기간의 각각의 날짜와 현재 날짜의 날짜 차이 반환
    func fromNowCurrentDate() -> [Int] {
        let nowDate: Date
        //iOS 버전 분기
        if #available(iOS 15, *) {
            nowDate = Calendar.current.startOfDay(for: .now)
        } else {
            nowDate = Calendar.current.startOfDay(for: NSDate.now as Date)
        }
        let startDateSinceNow = Int(self.startDate.timeIntervalSince(nowDate) / (3600 * 24))
        let endDateSinceNow = Int(self.endDate.timeIntervalSince(nowDate) / (3600 * 24))
        
        var day: [Int] = []
        
        for n in startDateSinceNow...endDateSinceNow {
            day.append(n);
        }
        
        return day
    }
    
    //일정 시작날짜를 "11/03"형식의 문자열로 반환
    func getStartDateString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "MM/dd"
        
        return formatter.string(from: self.startDate)
    }
    
    //일정 시작날짜를 "11/03"형식의 문자열로 반환
    func getEndDateString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "MM/dd"
        
        return formatter.string(from: self.endDate)
    }
    
//    func getStringStartWeek() -> String {
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "ko_KR")
//        formatter.dateFormat = "EEEEEE"
//        
//        return formatter.string(from: self.startDate)
//    }
//    
//    func getStringEndWeek() -> String {
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "ko_KR")
//        formatter.dateFormat = "EEEEEE"
//        
//        return formatter.string(from: self.endDate)
//    }
}
