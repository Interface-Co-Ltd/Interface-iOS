//
//  LoginTextfieldView.swift
//  PrototypeIF
//
//  Created by 김도형 on 2022/09/13.
//

import SwiftUI

struct LoginTextfieldView: View {
    @Binding var showLoginView: Bool
    @Binding var id: String
    @Binding var wrongId: Bool
    @Binding var password: String
    @Binding var idStore: Bool
    @Binding var passwordStore: Bool
    
    //@Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                TextField("아이디", text: $id, prompt: !wrongId ? Text("아이디") : Text("아이디 오류").foregroundColor(.red))
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.username)
                    .padding()
            } else {
                TextField("아이디", text: $id)
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
                if idStore == false {
                    id = ""
                }
                
                if passwordStore == false {
                    password = ""
                }
                
                withAnimation(.easeOut(duration: 0.5)) {
                    showLoginView = false
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
        LoginTextfieldView(showLoginView: .constant(true), id: .constant(""), wrongId: .constant(false), password: .constant(""), idStore: .constant(false), passwordStore: .constant(false))
    }
}
