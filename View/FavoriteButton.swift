//
//  FavoriteButton.swift
//  InterfaceCoLtd
//
//  Created by 안수경 on 2022/11/29.
//

import SwiftUI

struct FavoriteButton: View {
    @State var isSet: Bool
    @State var store: [Cooperation]
    @State var cooperation: Int
    
    var body: some View {
        VStack {
            Button {
                if isSet {
                    store[cooperation].favoriteCount -= 1
                    store[cooperation].favorites?[UUID()] = nil
                    
                } else {
                    store[cooperation].favoriteCount += 1
                    store[cooperation].favorites?[UUID()] = true
                }
                isSet.toggle()
            } label: {
                Label("Favorite Button", systemImage: isSet ? "heart.fill" : "heart")
                    .labelStyle(.iconOnly)
                    .foregroundColor(isSet ? .red: .gray)
            }
            
            Text("\(store[cooperation].favoriteCount)")
                .foregroundColor(.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: false, store: CooperationViewModel.preview.cooperationList!, cooperation: 0)
    }
}
