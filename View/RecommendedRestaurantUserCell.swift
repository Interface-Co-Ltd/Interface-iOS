//
//  RecommendedRestaurantUserCell.swift
//  InterfaceCoLtd
//
//  Created by 안수경 on 2022/11/16.
//

import SwiftUI

struct RecommendedRestaurantUserCell: View {
    @ObservedObject var recommendedRestaurant: RecommendedRestaurant
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 1){
            HStack(alignment: .bottom){
                Text("동기창")
                    .font(.system(size: 20))
                    .foregroundColor(.primary)
                    .bold()
                Text("회장")
                    .font(.system(size: 12))
                    .foregroundColor(.primary)
                Text("32th")
                    .font(.system(size: 15))
                    .foregroundColor(Color(.sRGB, red: 0/255.0, green: 0/255.0, blue: 128.0/255.0, opacity: 1.0))
                    .bold()
            }
            .padding(5)
            Text("컴퓨터공학과")
                .font(.system(size: 20))
                .foregroundColor(.primary)
                .padding(5)
            Text("20010655")
                .font(.system(size: 12))
                .foregroundColor(.primary)
                .padding(5)
            Image("interface-logo")
                .resizable().frame(width: 75, height: 85.35)
                .position(x: 280, y: -20)
                .opacity(0.6)
                
        }
        
        .cornerRadius(15)
        .frame(width: UIScreen.main.bounds.size.width - 80)
        .frame(height: 100)
        .padding(20)
        .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg")))
        
        //        .background(Color(.sRGB, red: 220.0/255.0, green: 226.0/255.0, blue: 240.0/255.0, opacity: 1.0))
        //        .cornerRadius(15)
        //        .shadow(radius: 1)
        
    }
}


struct RecommendedRestaurantUserCell_Previews: PreviewProvider {
    static var previews: some View {
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
}
