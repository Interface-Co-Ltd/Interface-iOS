//
//  MenuNotificationView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//

import SwiftUI

struct MenuNotificationView: View {
    @State private var emergencyIsOn = true
    @State private var noticeIsOn = true
    @State private var QnAIsOn = true
    
    var body: some View {
        List {
            Section {
                Toggle("긴급공지", isOn: $emergencyIsOn)
                Toggle("공지사항", isOn: $noticeIsOn)
                Toggle("질문게시판", isOn: $QnAIsOn)
            }
            .listRowBackground(Color("sub-view-bkg-accent"))
        }
        .navigationTitle("알림설정")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("bkg").ignoresSafeArea())
        .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
    }
}

struct MenuNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        MenuNotificationView()
    }
}
