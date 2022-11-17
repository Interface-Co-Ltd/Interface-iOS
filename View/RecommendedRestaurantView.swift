//
//  RestaurantView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/03.
//

import SwiftUI

struct RecommendedRestaurantView: View {
    @EnvironmentObject var store: RecommendedRestaurantViewModel
    @State var writer = "동기창"
    
    var body: some View {
        VStack {
            
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
        }.navigationTitle(writer + "님의 맛집")
    }
}

struct RecommendedRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedRestaurantView()
            .environmentObject(RecommendedRestaurantViewModel())
            
    }
}


