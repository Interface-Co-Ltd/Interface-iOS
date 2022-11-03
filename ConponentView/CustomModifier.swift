//
//  CustomModifier.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/29.
//

import SwiftUI

struct VersionedNavigationBarColorModifier: ViewModifier {
    private let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .toolbarBackground(self.color.opacity(0.8), for: .navigationBar)
                .scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}

struct VersionedTabBarColorModifier: ViewModifier {
    private let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .toolbarBackground(self.color.opacity(0.8), for: .tabBar)
                .scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}

struct VersionedSubViewBackgroundModifier: ViewModifier {
    private let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
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
