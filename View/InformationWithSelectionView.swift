//
//  InformationWithSelectionView.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/15.
//

import SwiftUI
import SwiftUICalendar

extension YearMonthDay: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.year)
        hasher.combine(self.month)
        hasher.combine(self.day)
    }
}

struct InformationWithSelectionView: View {
    @ObservedObject var controller = CalendarController()
    var informations = [YearMonthDay: [(String, Color)]]()
    @State var focusDate: YearMonthDay? = nil
    @State var focusInfo: [(String, Color)]? = nil
    
    @State var schedule: [Schedule]
    
    init(schedule: [Schedule]) {
        self.schedule = schedule
        var date = YearMonthDay.current
        
        schedule.forEach { scheduleDate in
            scheduleDate.fromNowCurrentDate().forEach { day in
                date = date.addDay(value: day)
                if informations[date] == nil {
                    informations[date] = []
                }
                
                informations[date]?.append((scheduleDate.content, scheduleDate.scheduleType == "세종대학교" ? Color(red: 0.986, green: 0.107, blue: 0.281) : Color(hue: 0.581, saturation: 0.728, brightness: 0.98)))
                date = YearMonthDay.current
            }
        }
    }
    
    var body: some View {
        GeometryReader { reader in
            VStack(alignment: .leading) {
                CalendarView(controller, header: { week in
                    GeometryReader { geometry in
                        Text(week.shortString(locale: Locale(identifier: "ko_kr")))
                            .font(.subheadline)
                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                    }
                }, component: { date in
                    GeometryReader { geometry in
                        VStack(alignment: .leading, spacing: 0) {
                            if date.isToday {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.red.opacity(0.95))
                                        .frame(width: 15)
                                    Text("\(date.day)")
                                        .font(.system(size: 10, weight: .bold, design: .default))
                                        .foregroundColor(.white)
                                }
                                .padding(4)
                            } else {
                                
                                Text("\(date.day)")
                                    .font(.system(size: 10, weight: .light, design: .default))
                                    .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                    .foregroundColor(getColor(date))
                                    .padding(4)
                                
                            }
                            
                            if let infos = informations[date] {
                                ForEach(infos.indices, id: \.self) { index in
                                    let info = infos[index]
                                    
                                    if focusInfo != nil {
                                        Rectangle()
                                            .fill(info.1.opacity(0.75))
                                            .frame(width: geometry.size.width - 5, height: 4, alignment: .center)
                                            .cornerRadius(2)
                                            .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                    } else {
                                        Text(info.0)
                                            .lineLimit(1)
                                            .foregroundColor(.white)
                                            .font(.system(size: 8, weight: .bold, design: .default))
                                            .frame(width: geometry.size.width - 5, alignment: .center)
                                            .background(info.1.opacity(0.75))
                                            .cornerRadius(3)
                                            .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                            .padding(.bottom, 5)
                                    }
                                    
                                }
                            }
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                        .border(.green.opacity(0.8), width: (focusDate == date ? 1 : 0))
                        .cornerRadius(2)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                if focusDate == date {
                                    focusDate = nil
                                    focusInfo = nil
                                } else {
                                    focusDate = date
                                    focusInfo = informations[date]
                                }
                            }
                        }
                    }
                })
                if let infos = focusInfo {
                    ForEach(infos.indices, id: \.self) { index in
                        let info = infos[index]
                        Button {
                            
                        } label: {
                            HStack(spacing: 0) {
                                Circle()
                                    .fill(info.1.opacity(0.75))
                                    .frame(width: 12, height: 12)
                                
                                Text(info.0)
                                    .padding(.horizontal)
                                
                                Spacer()
                            }
                            .padding()
                            .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg-accent")))
                        }
                    }
                    .frame(width: .infinity, height: .infinity, alignment: .leading)
                    .buttonStyle(ScaledButtonStyle())
                }
            }
            .navigationBarTitle("\(controller.yearMonth.monthShortStringKR), \(String(controller.yearMonth.year))")
            .padding([.horizontal, .bottom])
        }
        .background(Color("bkg").ignoresSafeArea())
    }
    
    private func getColor(_ date: YearMonthDay) -> Color {
        if date.dayOfWeek == .sun {
            return Color.red
        } else if date.dayOfWeek == .sat {
            return Color.blue
        } else {
            return Color.primary
        }
    }
}

extension YearMonth {
    public var monthShortStringKR: String {
        get {
            var components = toDateComponents()
            components.day = 1
            components.hour = 0
            components.minute = 0
            components.second = 0
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM"
            formatter.locale = Locale(identifier: "ko_kr")
            return formatter.string(from: Calendar.current.date(from: components)!)
        }
    }
}

struct InformationWithSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        InformationWithSelectionView(schedule: ScheduleViewModel().schedule)
    }
}
