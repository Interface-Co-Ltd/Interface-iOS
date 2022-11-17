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
    
    let div: ScheduleType
    let content: String
    let startDate: Date
    let endDate: Date
    let place: String
    let allDay: Bool
    
    
    init(content: String, startDate: String, endDate: String, place: String, allDay: Bool, scheduleType: String) {
        
        self.div = scheduleType == "인터페이스" ? .interface : .sejong
        
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

//preview용 일정 모델 리스트 생성자 사용시 코드 "Schedule.preview"
extension Schedule {
    static var preview: [Schedule] {
        var scheduleList: [Schedule] = []
        
        scheduleList.append(Schedule(content: "개강총회", startDate: "22/09/02", endDate: "22/09/02", place: "센B116", allDay: true, scheduleType: "인터페이스"))
        
        scheduleList.append(Schedule(content: "회비납부 마감", startDate: "22/09/30", endDate: "22/09/30", place: "없음", allDay: true, scheduleType: "인터페이스"))
        
        scheduleList.append(Schedule(content: "안수경 아이폰 언박싱", startDate: "22/10/07", endDate: "22/10/07", place: "동아리방", allDay: false, scheduleType: "인터페이스"))
        
        scheduleList.append(Schedule(content: "중간고사", startDate: "22/10/20", endDate: "22/10/26", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        scheduleList.append(Schedule(content: "할로윈 행사", startDate: "22/10/31", endDate: "22/10/31", place: "없음", allDay: true, scheduleType: "인터페이스"))
        
        scheduleList.append(Schedule(content: "중간고사 성적열람 및 정정", startDate: "22/11/01", endDate: "22/11/06", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        scheduleList.append(Schedule(content: "학생예비군", startDate: "22/11/01", endDate: "22/11/04", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        scheduleList.append(Schedule(content: "인터페이스 창립제", startDate: "22/11/19", endDate: "22/11/19", place: "없음", allDay: true, scheduleType: "인터페이스"))
        
        scheduleList.append(Schedule(content: "프로그래밍 전시회", startDate: "22/12/01", endDate: "22/12/02", place: "없음", allDay: true, scheduleType: "인터페이스"))
        
        scheduleList.append(Schedule(content: "계절학기 수강신청", startDate: "22/12/01", endDate: "22/12/05", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        scheduleList.append(Schedule(content: "기말고사", startDate: "22/12/15", endDate: "22/12/21", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        scheduleList.append(Schedule(content: "기말고사 성적열람 및 정정", startDate: "22/12/27", endDate: "23/01/01", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        scheduleList.append(Schedule(content: "기말고사 성적마감", startDate: "23/01/02", endDate: "23/01/03", place: "없음", allDay: true, scheduleType: "세종대학교"))
        
        return scheduleList
    }
}
