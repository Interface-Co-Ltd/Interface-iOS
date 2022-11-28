//
//  SubCalendarView.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/14.
//

import SwiftUI

struct SubCalendarView: View {
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    
    @State var isCurrentWeek = true
    
    static func nowSinceSunday() -> TimeInterval {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "EEEEEE"
        
        let now: Date
        if #available(iOS 15, *) {
            now = .now
        } else {
            now = NSDate.now as Date
        }
        
        let week = formatter.string(from: now)
        
        switch week {
        case "일":
            return 3600 * 24 * 6
        case "월":
            return 3600 * 24 * 5
        case "화":
            return 3600 * 24 * 4
        case "수":
            return 3600 * 24 * 3
        case "목":
            return 3600 * 24 * 2
        case "금":
            return 3600 * 24
        default:
            return 0
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("이번주 인페 일정")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .unredacted()
                Spacer()
            }
            .padding(.leading)
            
            VStack(alignment: .leading, spacing: 20) {
                Section {
                    if scheduleViewModel.subViewSchdules.count != 0 {
                            ForEach(scheduleViewModel.subViewSchdules) { schdl in
                                HStack {
                                    VStack(alignment: .trailing, spacing: 2) {
                                        Image(schdl.div == "세종대학교" ? "sejong-univ-logo" : "interface-logo")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .opacity(0.7)
                                    }
                                    
                                    HStack(spacing: 5) {
                                        Text(schdl.content)
                                            .font(.subheadline)
                                            .lineLimit(1)
                                            .allowsTightening(true)
                                        
                                        if schdl.startDate.timeIntervalSinceNow <= 0 && schdl.endDate.timeIntervalSinceNow + 3600 * 24 >= 0 {
                                            Text("진행중!")
                                                .foregroundColor(.red)
                                                .font(.caption2)
                                        }
                                        
                                        if schdl.startDate.timeIntervalSinceNow > SubCalendarView.nowSinceSunday() {
                                            Text("다음주")
                                                .foregroundColor(.blue)
                                                .font(.caption2)
                                        }
                                        
                                        Spacer()
                                        
                                        if schdl.startDate == schdl.endDate {
                                            Text(schdl.getStartDateString())
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        } else {
                                            Text("\(schdl.getStartDateString())~\(schdl.getEndDateString())")
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }
                                .opacity(schdl.startDate.timeIntervalSinceNow <= SubCalendarView.nowSinceSunday() ? 1 : 0.5)
                            }
                        } else {
                            HStack {
                                Spacer()
                                
                                Text("이번주엔 일정이 없어요.")
                                    .font(.subheadline)
                                    .unredacted()
                                
                                Spacer()
                            }
                        }
                    }
            }
            .padding(.all, 25)
            .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg")))
        }
    }
}

struct SubCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        SubCalendarView()
            .environmentObject(ScheduleViewModel.preview)
    }
}
