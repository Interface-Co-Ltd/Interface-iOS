//
//  NoticeDetailView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//

import SwiftUI

struct NoticeDetailView: View {
    @State var notice: Board
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(notice.title)
                            .padding()
                            .font(.largeTitle)
                            //.bold()
                        Spacer(minLength: 0)
                    }
                    
                    HStack {
                        Text(notice.content)
                            .padding()
                        Spacer(minLength: 0)
                    }
                    HStack {
                        Text(notice.createdDate, style: .date)
                        Text("| 작성자: " + notice.user)
                        Spacer()
                    }.font(.footnote)
                        .foregroundColor(.secondary)
                        .padding()
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
}


struct NoticeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeDetailView(notice: Board(title: "hi", content: "hi", type: "공지", user: "동기창", images: nil, createdDate: Date(), modifiedDate: Date()))
    }
}
