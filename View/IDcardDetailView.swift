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
        GeometryReader { reader in
            NavigationView {
                ZStack{
                    Image("logo-background")
                        .resizable()
                        .aspectRatio(contentMode:.fill)
                        .opacity(0.8)
                        .ignoresSafeArea()
                    
                    HStack {
                        Spacer()
                        
                        VStack{
                            Spacer()
                            
                            Image("sejong-univ-logo")
                                .resizable()
                                .frame(width:200,height: 200)
                                .opacity(0.3)
                            Image("interface-logo-white")
                                .resizable()
                                .frame(width:250,height: 250)
                                .opacity(0.3)
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading,spacing: 30){
                            if let user = userViewModel.currentUser{
                                Text(user.name)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .bold()
                                Text(user.email)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .bold()
                                Text(user.studentId)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .bold()
                                Text("인터페이스")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .bold()
                                Text(user.auth == "ROLE_ADMIN" ? "집부" : "부원")
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .bold()
                                Text(user.phone)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            
                            Spacer()
                        }
                        .offset(x: 0, y: reader.size.height / 6)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
    
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        IDcardDetailView()
            .environmentObject(UserViewModel.preview)
    }
}

