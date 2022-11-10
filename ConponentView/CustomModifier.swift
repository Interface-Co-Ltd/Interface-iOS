//
//  CustomModifier.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/29.
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
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .confirmationDialog("로그아웃", isPresented: $showLogoutDialog) {
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
                }
        } else {
            content
                .alert(isPresented: $showLogoutDialog) {
//                    Alert(title: Text("로그아웃 하시겠습니까?"), message: Text(""), dismissButton: .destructive(Text("로그아웃")))
                    Alert(title: Text("로그아웃 하시겠습니까?"), primaryButton: .destructive(Text("로그아웃")), secondaryButton: .cancel(Text("취소")))
                }

        }
    }
}

//검색 기능(보류)
struct CustomSearchView: ViewModifier {
    @Binding var isSearching: String
    @Binding var boardViewModel: BoardViewModel
    @Binding var appearSearchView: Any
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .overlay {
//                    appearSearchView
                }
        } else {
            content
        }
    }
}
