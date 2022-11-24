//
//  NoticeView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//

import SwiftUI

struct NoticeView: View {
    @EnvironmentObject var store: NoticeViewModel
    @State var isLoading = true
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(store.list) { notice in
                    NavigationLink {
                        NoticeDetailView(notice: notice)
                    } label: {
                        NoticeCell(notice: notice)
                    }
                    .padding(10)
                    .padding(.bottom, 20)
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }.navigationTitle("공지사항")
            .redacted(reason: isLoading ? .placeholder : [])
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isLoading = false
                }
            }

    }
}

struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView()
            .environmentObject(NoticeViewModel())
            
    }
}


