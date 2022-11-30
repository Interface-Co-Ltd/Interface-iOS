//
//  IdcardView.swift
//  InterfaceCoLtd
//
//  Created by 김해린 on 2022/11/15.
//

import SwiftUI

struct SubIDCardView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.colorScheme) var scheme
    @State var isLoading = true
    
    var body: some View {
        ZStack{
            ZStack{
                Image("logo-background")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 10)
                    .opacity(scheme == .light ? 1.0 : 0.65)
                VStack{
                    Spacer(minLength: 50)
                    
                    HStack{
                        Spacer()
                        
                        Image("interface-logo-white")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(0.6)
                    }
                }
            }
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    if let user = userViewModel.currentUser{
                        HStack(alignment: .bottom, spacing: 10) {
                            HStack(alignment: .bottom, spacing: 5) {
                                Text(user.name)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(user.auth == "ROLE_ADMIN" ? "집부" : "부원")
                                    .font(.footnote)
                            }
                            
//                            Text("\(user.generation)th")
//                                .font(.headline)
//                                .foregroundColor(.green)
                            
                            Spacer()
                        }
                        
                        Text(user.email)
                            .font(.title3)
                        
                        Text(user.studentId)
                            .font(.subheadline)
                    }
                }
                .foregroundColor(.white)
                .padding(25)
                
                Spacer()
            }
            .redacted(reason: userViewModel.fetchCompleted ? [] : .placeholder)
//            .onAppear() {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    isLoading = false
//                }
//            }
        }
        .frame(maxHeight: 100)
    }
}

struct SubIDCardView_Previews: PreviewProvider {
    static var previews: some View {
        SubIDCardView()
            .environmentObject(UserViewModel.preview)
    }
}

