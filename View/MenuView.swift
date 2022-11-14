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
    
    //AppStorage로 바꿀 것
    @State private var currnetDisplayStyle = "시스템 기본값"
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
                                        withAnimation(.easeInOut) {
                                            displayStyle = .unspecified
                                            currnetDisplayStyle = "시스템 기본값"
                                            UIApplication.shared.windows.forEach { window in
                                                window.overrideUserInterfaceStyle = displayStyle
                                            }
                                        }
                                    }
                                    Button("라이트 모드") {
                                        withAnimation(.easeInOut) {
                                            displayStyle = .light
                                            currnetDisplayStyle = "라이트 모드"
                                            UIApplication.shared.windows.forEach { window in
                                                window.overrideUserInterfaceStyle = displayStyle
                                            }
                                        }
                                    }
                                    Button("다크 모드") {
                                        withAnimation(.easeInOut) {
                                            displayStyle = .dark
                                            currnetDisplayStyle = "다크 모드"
                                            UIApplication.shared.windows.forEach { window in
                                                window.overrideUserInterfaceStyle = displayStyle
                                            }
                                        }
                                    }
                                    
                                    Button(role: .cancel) {
                                        
                                    } label: {
                                        Text("취소")
                                    }
                                    
                                } message: {
                                    Text("화면 스타일 선택")
                                }
                                
                                Spacer()
                                
                                Button {
                                    // 시스템 기본값
                                } label: {
                                    Text(currnetDisplayStyle)
                                }.foregroundColor(.secondary)
                                
                            } else {
                                Text("화면 스타일 설정")
                                
                                Spacer()
                                
                                //ios14버전 시뮬레이터 깔아야함
                                Menu {
                                    Button("시스템 기본값") {
                                        displayStyle = .unspecified
                                        currnetDisplayStyle = "시스템 기본값"
                                        
                                        UIApplication.shared.windows.forEach { window in
                                            window.overrideUserInterfaceStyle = displayStyle
                                        }
                                    }
                                    
                                    Button("라이트 모드") {
                                        displayStyle = .light
                                        currnetDisplayStyle = "라이트 모드"
                                        
                                        UIApplication.shared.windows.forEach { window in
                                            window.overrideUserInterfaceStyle = displayStyle
                                        }
                                    }
                                    
                                    Button("다크 모드") {
                                        displayStyle = .dark
                                        currnetDisplayStyle = "다크 모드"
                                        
                                        UIApplication.shared.windows.forEach { window in
                                            window.overrideUserInterfaceStyle = displayStyle
                                        }
                                    }
                                } label: {
                                    Text(currnetDisplayStyle)
                                        .foregroundColor(.secondary)
                                }
                            }
                            
                            
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
                        .modifier(VersionedLogoutButtonOnMenu(showLogoutDialog: $showLogoutDialog))
                    } header: {
                        Text("계정")
                    }.listRowBackground(Color("sub-view-bkg-accent"))
                }
            }
            .listStyle(.insetGrouped)
            .onAppear() {
                UITableView.appearance().backgroundColor = .clear
            }
            .background(Color("bkg").ignoresSafeArea())
            .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
            .navigationTitle("메뉴")
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
