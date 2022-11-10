//
//  RestaurantView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/03.
//

import SwiftUI

struct RecommendedRestaurantView: View {
    @EnvironmentObject var store: RecommendedRestaurantModel
    
    var body: some View {
        VStack {
            
            RecommendedRestaurantCategoryView()
            
            ScrollView {
                ForEach(store.list) { recommendedRestaurant in
                    NavigationLink {
                        RecommendedRestaurantDetailView(recommendedRestaurant: recommendedRestaurant)
                    } label: {
                        RecommendedRestaurantCell(recommendedRestaurant: recommendedRestaurant)
                    }
                    .padding(10)
                    
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }.navigationTitle("맛집 추천")
    }
}

struct RecommendedRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedRestaurantView()
            .environmentObject(RecommendedRestaurantModel())
            
    }
}


