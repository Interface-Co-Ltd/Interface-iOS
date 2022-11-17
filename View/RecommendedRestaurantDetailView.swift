//
//  RestaurantDetailView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/03.
//

import SwiftUI

struct RecommendedRestaurantDetailView: View {
    @ObservedObject var recommendedRestaurant: RecommendedRestaurant
    @EnvironmentObject var store: RecommendedRestaurantViewModel
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                VStack {
                    HStack {
                        Text(recommendedRestaurant.title)
                            .padding(.trailing, 5)
                            .font(.largeTitle)
                            //.bold()
                        
                        Text(recommendedRestaurant.category)
                            .font(.body)
                            .padding(5)
                            //.bold()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.sRGB, red: 0.0/255.0, green: 0.0/255.0, blue: 128.0/255.0, opacity: 1.0), lineWidth: 3)
                            )
                        Spacer(minLength: 0)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        
                        Text("위치")
                            .bold()
                        Spacer(minLength: 0)
                    }.padding(.leading)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    
                    HStack {
                        Text(recommendedRestaurant.location)
                            .padding(.leading)
                            .padding(.bottom)
                        Spacer(minLength: 0)
                    }
                    
                    
                    HStack {
                        Image(systemName: "phone")
                        Text("전화번호")
                            .bold()
                        Spacer(minLength: 0)
                    }.padding(.leading)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    
                    HStack {
                        Text(recommendedRestaurant.phone)
                            .padding(.leading)
                            .padding(.bottom)
                        Spacer(minLength: 0)
                    }
                    
                    HStack {
                        Image(systemName: "alarm")
                        Text("영업시간")
                            .bold()
                        Spacer(minLength: 0)
                    }.padding(.leading)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    HStack {
                        Text(recommendedRestaurant.operatingTime)
                            .padding(.leading)
                            .padding(.bottom)
                        Spacer(minLength: 0)
                    }
                    
                    HStack {
                        Image(systemName: "fork.knife")
                        Text("메뉴")
                            .bold()
                        Spacer(minLength: 0)
                    }.padding(.leading)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
//                    VStack {
//                        ForEach(restaurant.menu) { menu in
//                            HStack{
//                                Text(menu.0)
//                                    .padding()
//                                Text(menu.1)
//                                    .padding()
//                            }
//                        }
//                    }
                    
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
}


struct RecommendedRestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedRestaurantDetailView(recommendedRestaurant: RecommendedRestaurant(writer: "동기창",                                 title: "컴포즈커피 세종대점",
                                                    category: "디저트",
                                                    content: "와플이 맛있어요🤤",
                                                    location: "서울 광진구 능동로 195-16 김원관 1층",
                                                    phone: "02-2088-7131",
                                                    operatingTime:
                                                     """
                                                     월  08:00 - 23:00
                                                     화  08:00 - 23:00
                                                     수  08:00 - 23:00
                                                     목  08:00 - 23:00
                                                     금  08:00 - 23:00
                                                     토  08:00 - 23:00
                                                     일  08:00 - 23:00
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
        .environmentObject(RecommendedRestaurantViewModel())
    }
}
