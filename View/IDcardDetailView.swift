//
//  IDcardDetailView.swift
//  InterfaceCoLtd
//
//  Created by 김해린 on 2022/11/15.
//

import SwiftUI

struct IDcardDetailView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var isLoading = true
    
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
                if let user = userViewModel.currentUser{
                    Text(user.userName)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .bold()
                    Text(user.major)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .bold()
                    Text(user.studentId)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .bold()
                    Text("인터페이스")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .redacted(reason: isLoading ? .placeholder : [])
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isLoading = false
                }
            }
        }
    }
    
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        IDcardDetailView()
    }
}

