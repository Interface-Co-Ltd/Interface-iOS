//
//  Schedule.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/03.
//

import Foundation

struct Schedule: Identifiable {
    var id = UUID()
    
    let scheduleType: String
    let content: String
    let startDate: Date
    let endDate: Date
    let place: String
    let allDay: Bool
    
    init(content: String, startDate: String, endDate: String, place: String, allDay: Bool, scheduleType: String) {
        
        self.scheduleType = scheduleType
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy/MM/dd"
        
        self.content = content
        
        if let date = formatter.date(from: startDate) {
            self.startDate = date
        } else {
            if #available(iOS 15, *) {
                self.startDate = .now
            } else {
                self.startDate = NSDate.now as Date
            }
        }
        
        if let date = formatter.date(from: endDate) {
            self.endDate = date
        } else {
            if #available(iOS 15, *) {
                self.endDate = .now
            } else {
                self.endDate = NSDate.now as Date
            }
        }
        
        self.place = place
        self.allDay = allDay
    }
    
    func fromNowCurrentDate() -> [Int] {
        let nowDate: Date
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
    
    func getStartDateString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "MM/dd"
        
        return formatter.string(from: self.startDate)
    }
    
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
