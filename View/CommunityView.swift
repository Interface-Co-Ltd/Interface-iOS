//
//  CommunityView.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/17.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        GeometryReader { reader in
            NavigationView {
                VStack {
                    Text("커밍 순~~~~~")
                        .foregroundColor(.secondary)
                }
                .frame(width: reader.size.width, height: reader.size.height)
                .navigationTitle("커뮤니티")
                .background(Color("bkg").ignoresSafeArea())
            }
            .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
