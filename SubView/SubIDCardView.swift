//
//  IdcardView.swift
//  InterfaceCoLtd
//
//  Created by 김해린 on 2022/11/15.
//

import SwiftUI

struct SubIDCardView: View {
    @EnvironmentObject var store: UserViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 1){
            HStack(alignment: .bottom){
                Text(store.currentUser.userName)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .bold()
                Text(store.currentUser.auth)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                Text(store.currentUser.generation)
                    .font(.system(size: 15))
                    .foregroundColor(.green)
                    .bold()
            }
            .padding(5)
            Text(store.currentUser.major)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(5)
            Text(store.currentUser.studentId)
                .font(.system(size: 12))
                .foregroundColor(.white)
                .padding(5)
            Image("interface-logo-white")
                .resizable().frame(width: 75, height: 85.35)
                .position(x: 280, y: -35)
                .opacity(0.6)
                
        }
        .frame(maxHeight: 100)
//        .frame(width:330, height: 100, alignment: .leading)
        .padding(25)
        .background(Image("logo-background").resizable())
        .cornerRadius(20)
    }
}

struct SubIDCardView_Previews: PreviewProvider {
    static var previews: some View {
        SubIDCardView()
    }
}

