//
//  RestaurantCategoryView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/03.
//

import SwiftUI

struct RecommendedRestaurantCategoryView: View {
    @State private var KIsOn = false
    @State private var CIsOn = false
    @State private var JIsOn = false
    @State private var WIsOn = false
    @State private var DIsOn = false
    @State private var EIsOn = false
    
    var body: some View {
        HStack {
            VStack {
                Button(action: {KIsOn.toggle()}) {
                    VStack{
                        Image(systemName: "k.circle")
                            .font(.title)
                            .imageScale(.large)
                            
                        Text("한식")
                    }.foregroundColor(KIsOn ? .blue: .black)
                }
            }.padding(5)
            
            
            VStack {
                Button(action: {CIsOn.toggle()}) {
                    VStack {
                        Image(systemName: "c.circle")
                            .font(.title)
                            .imageScale(.large)
                            
                        Text("중식")
                    }.foregroundColor(CIsOn ? .blue: .black)
                }
            }.padding(5)
            
            VStack {
                Button(action: {JIsOn.toggle()}) {
                    VStack {
                        Image(systemName: "j.circle")
                            .font(.title)
                            .imageScale(.large)
                            
                        Text("일식")
                    }.foregroundColor(JIsOn ? .blue: .black)
                }
            }.padding(5)
            
            VStack {
                Button(action: {WIsOn.toggle()}) {
                    VStack {
                        Image(systemName: "w.circle")
                            .font(.title)
                            .imageScale(.large)
                            
                        Text("양식")
                    }.foregroundColor(WIsOn ? .blue: .black)
                }
            }.padding(5)
            
            VStack {
                Button(action: {DIsOn.toggle()}) {
                    VStack {
                        Image(systemName: "d.circle")
                            .font(.title)
                            .imageScale(.large)
                            
                        Text("디저트")
                    }.foregroundColor(DIsOn ? .blue: .black)
                }
            }.padding(5)
            
            VStack {
                Button(action: {EIsOn.toggle()}) {
                    VStack {
                        Image(systemName: "e.circle")
                            .font(.title)
                            .imageScale(.large)
                            
                        Text("기타")
                    }.foregroundColor(EIsOn ? .blue: .black)
                }
            }.padding(5)
        }
    }
}

struct RecommendedRestaurantCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedRestaurantCategoryView()
    }
}
