//
//  IDcardDetailView.swift
//  InterfaceCoLtd
//
//  Created by 김해린 on 2022/11/15.
//

import SwiftUI

struct ModalView: View {
    var body: some View {
        ZStack{
            Image("logo-background").resizable().aspectRatio(contentMode:.fill)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("interface-logo-white")
                    .opacity(0.3)
                Image("sejong-univ-logo")
                    .resizable()
                    .frame(width:298,height: 300)
                    .opacity(0.3)
            }
            VStack(spacing: 30){
                Text("김인페")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .bold()
                Text("컴퓨터공학과")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .bold()
                Text("20010655")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .bold()
                Text("인터페이스")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
    
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}

