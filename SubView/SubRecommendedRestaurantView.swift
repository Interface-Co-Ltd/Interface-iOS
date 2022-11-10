//
//  SubRecommendedRestaurantView.swift
//  InterfaceCoLtd
//
//  Created by 안수경 on 2022/11/10.
//

import SwiftUI

struct SubRecommendedRestaurantView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    Image(systemName: "fork.knife")
                        .imageScale(.small)
                    
                    Text("추천맛집")
                        .font(.subheadline)
                    
                    Spacer()
                }
                
            }
            .padding(.all, 15)
            .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg")))
        }
    }
}

struct SubRecommendedRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        SubRecommendedRestaurantView()
    }
}
