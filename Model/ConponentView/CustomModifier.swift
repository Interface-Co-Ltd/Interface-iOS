//
//  CustomModifier.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/17.
//

import SwiftUI

//네비게이션 색 지정 modifier
//iOS 16부터 지원
struct VersionedNavigationBarColorModifier: ViewModifier {
    private let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        //iOS 버전 분기
        if #available(iOS 16.0, *) {
            content
                .toolbarBackground(self.color.opacity(0.8), for: .navigationBar)
                .scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}

//탭바 색 지정 modifier
//iOS 16부터 지원
struct VersionedTabBarColorModifier: ViewModifier {
    private let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        //iOS 버전 분기
        if #available(iOS 16.0, *) {
            content
                .toolbarBackground(self.color.opacity(0.8), for: .tabBar)
                .scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}

//sub view 배경 지정 modifier
struct VersionedSubViewBackgroundModifier: ViewModifier {
    private let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        //iOS 버전 분기
        if #available(iOS 15.0, *) {
            content
                .background {
                    RoundedRectangle(cornerRadius: 20.0)
                        .foregroundColor(color)
                        .shadow(color: .black.opacity(0.15), radius: 3)
                }
        } else {
            content
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                .shadow(color: .black.opacity(0.15), radius: 3)
        }
    }
}

struct VersionedLogoutButtonOnMenu: ViewModifier {
    @Binding var showLogoutDialog: Bool
    @Binding var showLoginView: Bool
    @Binding var isAuthenticated: Bool
    @Binding var token: String
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .confirmationDialog("로그아웃", isPresented: $showLogoutDialog) {
                    Button(role: .destructive) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            isAuthenticated = false
                            token = ""
                            showLoginView = true
                        }
                    } label: {
                        Text("로그아웃")
                    }
                    
                    Button(role: .cancel) {
                        
                    } label: {
                        Text("취소")
                    }
                    
                } message: {
                    Text("로그아웃 하시겠습니까?")
                }
        } else {
            content
                .alert(isPresented: $showLogoutDialog) {
                    Alert(title: Text("로그아웃 하시겠습니까?"), primaryButton: .destructive(Text("로그아웃")), secondaryButton: .cancel(Text("취소")))
                }
            
        }
    }
}

struct VersionedUltraThinMaterialEffect: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .background(.ultraThinMaterial)
        } else {
            content
        }
    }
}

@available(iOS 15.0, *)
struct AutoTextFieldFocusModifier: ViewModifier {
    @FocusState var textFieldFocused: Bool
    
    @Binding var focused: Bool
    
    func body(content: Content) -> some View {
        content
            .focused($textFieldFocused)
            .onAppear() {
                textFieldFocused = focused
            }
    }
}

struct VersionedSearchViewTransitionModifier: ViewModifier {
    @Environment(\.colorScheme) var displayMode
    
    @Binding var isSearching: Bool
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .overlay {
                    if isSearching {
                        displayMode == .light ? Color.gray.opacity(0.5).ignoresSafeArea() : Color.black.opacity(0.9).ignoresSafeArea()
                    }
                }
        } else {
            content
        }
    }
}

struct DynamicIslandNotificationModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .overlay(alignment: .top) {
                    GeometryReader { reader in
                        let size = reader.size
                        
                        DynamicIslandNotification(size: size)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    }
                    .ignoresSafeArea()
                }
        } else {
            content
        }
    }
}

struct VersionedNetworkDisconnetedAlert: ViewModifier {
    @Binding var isConnected: Bool
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .overlay {
                    if !isConnected {
                        GeometryReader { reader in
                            VStack {
                                HStack {
                                    Spacer()
                                    
                                    Text("인터넷 연결이 필요해요.")
                                        .font(.subheadline)
                                        .foregroundColor(.red)
                                        .padding(5)
                                    
                                    Spacer()
                                }
                                .background(Color.secondary)
                            }
                        }
                    }
                }
        } else {
            content
        }
    }
}

struct ShowHeroEffectNoticeDetail: ViewModifier {
    @Binding var showDetailView: Bool
    
    @State var notice: Board
    
    var safeArea: EdgeInsets
    var size: CGSize
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .overlay {
                    if showDetailView {
                        NoticeDetailView(notice: notice, safeArea: safeArea, size: size)
                    }
                }
        } else {
            // Fallback on earlier versions
        }
    }
}
