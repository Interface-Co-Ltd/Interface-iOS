//
//  IdcardView.swift
//  InterfaceCoLtd
//
//  Created by 김해린 on 2022/11/15.
//

import SwiftUI

struct Idcard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 1){
            HStack(alignment: .bottom){
                Text("동기창")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .bold()
                Text("회장")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                Text("32th")
                    .font(.system(size: 15))
                    .foregroundColor(.green)
                    .bold()
            }
            .padding(5)
            Text("컴퓨터공학과")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(5)
            Text("20010655")
                .font(.system(size: 12))
                .foregroundColor(.white)
                .padding(5)
            Image("interface-logo-white")
                .resizable().frame(width: 75, height: 85.35)
                .position(x: 280, y: -20)
                .opacity(0.6)
                
        }
        .frame(width:330, height: 100, alignment: .leading)
        .padding()
        .background(Image("logo-background").resizable())
        .cornerRadius(15)
        Image("logo-background")
    }
}

struct Idcard_Previews: PreviewProvider {
    static var previews: some View {
        Idcard()
    }
}
