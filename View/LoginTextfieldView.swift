//
//  LoginTextfieldView.swift
//  PrototypeIF
//
//  Created by 김도형 on 2022/09/13.
//

import SwiftUI

struct LoginTextfieldView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @Binding var showLoginView: Bool
    @Binding var studentId: String
    @Binding var password: String
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                TextField("아이디", text: $studentId, prompt: Text("아이디"))
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.username)
                    .padding()
            } else {
                TextField("아이디", text: $studentId)
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
            
            if let error = loginViewModel.lastError, error == "아이디 또는 비밀번호가 틀렸습니다." {
                Text("아이디 또는 비밀번호가 잘못되었어요.")
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button {
                loginViewModel.studentId = studentId
                loginViewModel.password = password
                loginViewModel.fcmToken = delegate.fcmToken
                
                loginViewModel.login()
            } label: {
                Text("로그인")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            .padding()
        }
        .onChange(of: loginViewModel.isAuthenticated) {
            if $0 {
                withAnimation(.easeOut) {
                    showLoginView = false
                }
            }
        }
    }
}

struct LoginTextfieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextfieldView(showLoginView: .constant(true), studentId: .constant(""), password: .constant(""))
            .environmentObject(LoginViewModel.preview)
    }
}
