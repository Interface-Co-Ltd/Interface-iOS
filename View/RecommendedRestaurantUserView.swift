//
//  RecommendedRestaurantUserView.swift
//  InterfaceCoLtd
//
//  Created by 안수경 on 2022/11/16.
//

import SwiftUI

struct RecommendedRestaurantUserView: View {
    @State var store: [Cooperation]
    
    var body: some View {
        ScrollView {
            ForEach(store.indices) { index in
                NavigationLink {
                    MyWebView(urlToLoad: store[index].link)
//                        .navigationTitle("\(store[index].name)의 Pick")
                        .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
                        .background(Color("bkg").ignoresSafeArea())
                        
                } label: {
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 10){
                            HStack(alignment: .center){
                                Text("\(store[index].name)의 Pick")
                                    .font(.system(size: 20))
                                    .foregroundColor(.primary)
                                    .bold()
                                
                                Spacer()
                                
                            }
                            
                            Text("\(store[index].name)님의 세종대 맛집이에요.")
                        }
                        
                        Spacer()
                        FavoriteButton(isSet: store[index].favorites?.contains{
                            $0.key == UUID()
                        } ?? false, store: store, cooperation: index)
                    }
//                    .cornerRadius(15)
//                    .frame(width: UIScreen.main.bounds.size.width)
//                    .frame(height: 80)
                    .padding(20)
                    .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg")))
                    
                }
                .padding(10)
                .buttonStyle(PlainButtonStyle())
                
            }
        }
        .navigationTitle("맛집 추천")
        .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
        .background(Color("bkg").ignoresSafeArea())
    }
}

struct RecommendedRestaurantUserView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedRestaurantUserView(store: CooperationViewModel.preview.cooperationList!)
    }
}
