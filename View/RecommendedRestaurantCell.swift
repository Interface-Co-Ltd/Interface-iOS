//
//  RestaurantCell.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/03.
//

import SwiftUI

struct RecommendedRestaurantCell: View {
    @ObservedObject var recommendedRestaurant: RecommendedRestaurant
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(recommendedRestaurant.title)
                    .font(.title2)
                    .bold()
                    .lineLimit(1)
                Text(recommendedRestaurant.category)
                    .font(.caption)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.sRGB, red: 0.0/255.0, green: 0.0/255.0, blue: 128.0/255.0, opacity: 1.0), lineWidth: 2)
                    )
                Spacer(minLength: 0)
            }
            .padding(.bottom, 5)
            .padding(.trailing, 5)
            
            Text(recommendedRestaurant.location)
                .font(.body)
                .lineLimit(1)
                .padding(.bottom, 5)
            
            Text("\" " + recommendedRestaurant.content + " \"")
                .font(.callout)
                .italic()
                .lineLimit(1)
                
        }
        .frame(width: UIScreen.main.bounds.size.width - 80)
        .padding(20)
        .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg")))
        
    }
}

struct RecommendedRestaurantCell_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedRestaurantCell(recommendedRestaurant: RecommendedRestaurant(writer: "동기창",
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
                                             )
        )
    }
}
