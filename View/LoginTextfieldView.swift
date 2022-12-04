//
//  LoginTextfieldView.swift
//  PrototypeIF
//
//  Created by 김도형 on 2022/09/13.
//

import SwiftUI

struct LoginTextfieldView: View {
    @Binding var showLoginView: Bool
    @Binding var studentId: String
    @Binding var password: String
    
    @Environment(\.colorScheme) var displayMode
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                TextField("아이디", text: $studentId, prompt: Text("아이디"))
                    .padding(10)
                    .background(displayMode == .dark ? Color("sub-view-bkg") : Color.white)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.15), radius: 3)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .textContentType(.username)
                    .padding()
            } else {
                TextField("아이디", text: $studentId)
                    .padding(10)
                    .background(displayMode == .dark ? Color("sub-view-bkg") : Color.white)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.15), radius: 3)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.username)
                    .padding()
            }
            
            
            if #available(iOS 15.0, *) {
                SecureField("비밀번호", text: $password, prompt: Text("비밀번호"))
                    .padding(10)
                    .background(displayMode == .dark ? Color("sub-view-bkg") : Color.white)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.15), radius: 3)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .textContentType(.password)
                    .padding()
            } else {
                SecureField("비밀번호", text: $password)
                    .padding(10)
                    .background(displayMode == .dark ? Color("sub-view-bkg") : Color.white)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.15), radius: 3)
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
