//
//  RecommendedRestaurantUserView.swift
//  InterfaceCoLtd
//
//  Created by 안수경 on 2022/11/16.
//

import SwiftUI

struct RecommendedRestaurantUserView: View {
    //    @EnvironmentObject var store: RecommendedRestaurantView
    
    var body: some View {
        VStack {
            ScrollView {
                NavigationLink {
                    RecommendedRestaurantView()
                        .environmentObject(RecommendedRestaurantViewModel())
                } label: {
                    RecommendedRestaurantUserCell(recommendedRestaurant: RecommendedRestaurant(writer: "동기창",
                                                                                               title: "컴포즈커피 세종대점",
                                                                                               category: "디저트",
                                                                                               content: "와플이 맛있어요🤤",
                                                                                               location: "서울 광진구 능동로 195-16 김원관 1층",
                                                                                               phone: "02-2088-7131",
                                                                                               operatingTime:
                                                                                                """
                                                                                                월  08:00 - 23:00\n
                                                                                                화  08:00 - 23:00\n
                                                                                                수  08:00 - 23:00\n
                                                                                                목  08:00 - 23:00\n
                                                                                                금  08:00 - 23:00\n
                                                                                                토  08:00 - 23:00\n
                                                                                                일  08:00 - 23:00\n
                                                                                                """,
                                                                                               menu:
                                                                                                [
                                                                                                    ("아메리카노", "1,500"),
                                                                                                    ("카페라떼", "2,500"),
                                                                                                    ("밀크티", "3,800"),
                                                                                                    ("그린티라떼", "3,500"),
                                                                                                    ("플레인요거트스무디", "3,500"),
                                                                                                    ("허니자몽티", "3,500"),
                                                                                                    ("레몬에이드", "3,500")
                                                                                                ]
                                                                                              ))
                }
                .padding(10)
                .buttonStyle(PlainButtonStyle())
                .navigationTitle("맛집 추천")
            }
            
        }
    }
}

struct RecommendedRestaurantUserView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedRestaurantUserView()
    }
}
