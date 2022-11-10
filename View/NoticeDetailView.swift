//
//  NoticeDetailView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//

import SwiftUI

struct NoticeDetailView: View {
    @ObservedObject var notice: Notice
    @EnvironmentObject var store: NoticeModel
    
    
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
                        Text(notice.insertDate, style: .date)
                        Text("| 작성자: " + notice.writer)
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
        NoticeDetailView(notice: Notice(title: "2학기 회비 납부 공지", content:
"""
안녕하세요! 소통부장 동기창입니다!
현재 2학기 회비 납부기간입니다! 9월30일에 마감될 예정이니 2학기 활동 하실 분들 회비 납부하시면 여러 활동들 참가 가능하십니다!

✅ 납부 : 카카오뱅크 3333-22-6132866 임영빈
✅ 회비 : 20000원
✅ 기한 : 9월 30일까지
"""
                                  , insertDate: Date()))
            .environmentObject(NoticeModel())
    }
}
