//
//  MenuView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//

import SwiftUI

struct MenuView: View {
    @State private var showStyleDialog = false
    @State private var showLogoutDialog = false
    @State private var displayStyle = UIUserInterfaceStyle.unspecified
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    Section() {
                        
                        NavigationLink("알림 설정") {
                            MenuNotificationView()
                        }
                        
                        
                        HStack {
                            if #available(iOS 15.0, *) {
                                Button {
                                    // 화면 스타일
                                    showStyleDialog = true
                                } label: {
                                    Text("화면 스타일")
                                }
                                .foregroundColor(.primary)
                                .confirmationDialog("화면 스타일 선택", isPresented: $showStyleDialog) {
                                    Button("시스템 기본값") {
                                        displayStyle = .unspecified
                                        
                                        UIApplication.shared.windows.forEach { window in
                                            window.overrideUserInterfaceStyle = displayStyle
                                        }
                                    }
                                    Button("라이트 모드") {
                                        displayStyle = .light
                                        
                                        UIApplication.shared.windows.forEach { window in
                                            window.overrideUserInterfaceStyle = displayStyle
                                        }
                                    }
                                    Button("다크 모드") {
                                        displayStyle = .dark
                                        
                                        UIApplication.shared.windows.forEach { window in
                                            window.overrideUserInterfaceStyle = displayStyle
                                        }
                                    }
                                    
                                    if #available(iOS 15.0, *) {
                                        Button(role: .cancel) {
                                            
                                        } label: {
                                            Text("취소")
                                        }
                                    } else {
                                        Button {
                                            
                                        } label: {
                                            Text("취소")
                                        }
                                    }
                                    
                                } message: {
                                    Text("화면 스타일 선택")
                                }
                            } else {
                                // Fallback on earlier versions
                            }
                            
                            Spacer()
                            
                            Button {
                                // 시스템 기본값
                            } label: {
                                Text("시스템 기본값")
                            }.foregroundColor(.secondary)
                        }
                        
                        Button {
                            // 잠금 설정
                        } label: {
                            Text("잠금 설정")
                        }.foregroundColor(.primary)
                    } header: {
                        Text("앱 설정")
                    }
                    .listRowBackground(Color("sub-view-bkg-accent"))
                    
                    
                    Section() {
                        Button {
                            // 내 정보 변경
                        } label: {
                            Text("내 정보 변경")
                        }.foregroundColor(.primary)
                        
                        Button {
                            // 비밀번호 변경
                        } label: {
                            Text("비밀번호 변경")
                        }.foregroundColor(.primary)
                    } header: {
                        Text("내 정보")
                    }
                    .listRowBackground(Color("sub-view-bkg-accent"))
                    
                    Section() {
                        Button {
                            // 로그아웃
                            showLogoutDialog = true
                        } label: {
                            Text("로그아웃")
                        }
                        .foregroundColor(Color.red)
                        /*.confirmationDialog("로그아웃", isPresented: $showLogoutDialog) {
                            Button(role: .destructive) {
                                
                            } label: {
                                Text("로그아웃")
                            }
                            
                            Button(role: .cancel) {
                                
                            } label: {
                                Text("취소")
                            }
                            
                        } message: {
                            Text("로그아웃 하시겠습니까?")
                        }*/
                    } header: {
                        Text("계정")
                    }.listRowBackground(Color("sub-view-bkg-accent"))
                }
                //.scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            }
            .navigationTitle("메뉴")
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
