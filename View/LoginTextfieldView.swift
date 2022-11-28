//
//  LoginTextfieldView.swift
//  PrototypeIF
//
//  Created by 김도형 on 2022/09/13.
//

import SwiftUI

struct LoginTextfieldView: View {
    @Binding var showLoginView: Bool
    @Binding var studentID: String
    @Binding var password: String
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                TextField("아이디", text: $studentID, prompt: Text("아이디"))
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.username)
                    .padding()
            } else {
                TextField("아이디", text: $studentID)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.username)
                    .padding()
            }
            
            
            if #available(iOS 15.0, *) {
                SecureField("비밀번호", text: $password, prompt: Text("비밀번호"))
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.password)
                    .padding()
            } else {
                SecureField("비밀번호", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.password)
                    .padding()
            }
            
            Button {
                loginViewModel.studentID = studentID
                loginViewModel.password = password
                loginViewModel.login()
                
                if loginViewModel.isAuthenticated {
                    withAnimation(.easeOut(duration: 0.5)) {
                        showLoginView = false
                    }
                }
            } label: {
                Text("로그인")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct LoginTextfieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextfieldView(showLoginView: .constant(true), studentID: .constant(""), password: .constant(""))
            .environmentObject(LoginViewModel.preview)
    }
}
