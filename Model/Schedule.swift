//
//  Schedule.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/03.
//

import Foundation

enum ScheduleType {
    case interface
    case sejong
}

struct Schedule: Codable, Identifiable {
    let id = UUID()
    let div, content: String
    let startDate, endDate: Date
    let allDay: Int

    enum CodingKeys: String, CodingKey {
        case id, div, content
        case startDate = "start_date"
        case endDate = "end_date"
        case allDay = "all_day"
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
}

//preview용 일정 모델 리스트 생성자 사용시 코드 "Schedule.preview"
extension Schedule {
    static var preview: [Schedule] {
        var data = [Schedule]()
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            guard let jsonData = PreviewSchedule.data.data(using: .utf8) else {
                fatalError()
            }
            
            data = try decoder.decode([Schedule].self, from: jsonData)
        } catch {
            print("일정 미리보기 데이터 디코딩 실패")
        }
        
        return data
    }
}
