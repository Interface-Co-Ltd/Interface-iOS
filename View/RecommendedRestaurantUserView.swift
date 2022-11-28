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
        VStack {
            ScrollView {
                ForEach(store) { store in
                    NavigationLink {
                        MyWebView(urlToLoad: store.cooperationLink!.absoluteString)
                    } label: {
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 10){
                                HStack(alignment: .center){
                                    Text("\(store.cooperationName)의 Pick")
                                        .font(.system(size: 20))
                                        .foregroundColor(.primary)
                                        .bold()
                                    
                                    Spacer()
                                    
                                }
                                
                                Text("나의 학교 맛집")
                            }
            
                        Spacer()
                            VStack {
                                Image(systemName: "heart")
                                Text("5")
                            }
                            
                        }
                        .cornerRadius(15)
                        .frame(width: UIScreen.main.bounds.size.width - 80)
                        .frame(height: 80)
                        .padding(20)
                    .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg")))
                       
                        
                    }
                    .padding(10)
                    .buttonStyle(PlainButtonStyle())
                    .navigationTitle("맛집 추천")
                }
            }
            
        }
    }
}

struct RecommendedRestaurantUserView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedRestaurantUserView(store: CooperationViewModel.preview.cooperationList!)
    }
}
