//
//  LoginView.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/29.
//

import SwiftUI

struct LoginView: View {
//    @AppStorage("idStore") private var idStore: Bool = false
//    @AppStorage("passwordStore") private var passwordStore: Bool = false
    
    @Binding var autoLogin: Bool
    @Binding var showLoginView: Bool
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @State var studentID: String = ""
    @State var password: String = ""
    @State private var loginToggle = false
    @State private var showLoginTextfieldView = false
    
    var body: some View {
        ZStack {
            Image("logo-background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("interface-logo-reverse")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .preferredColorScheme(.light)
                    .frame(width: 250, height: 250)
                
                if showLoginTextfieldView {
                    Spacer()
                    
                    LoginTextfieldView(showLoginView: $showLoginView, studentID: $loginViewModel.studentID, password: $password)
                        .environmentObject(loginViewModel)
//                        .preferredColorScheme(.dark)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("아이디 및 비밀번호 찾기")
                            .foregroundColor(Color(red: 0.869, green: 1.0, blue: 0.504))
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: 300)
        }
        .ignoresSafeArea(showLoginTextfieldView ? [] : .all)
//        .preferredColorScheme(.light)
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut) {
                    showLoginTextfieldView = true
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(autoLogin: .constant(false), showLoginView: .constant(true))
            .environmentObject(LoginViewModel.preview)
    }
}