//
//  NoticeCell.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//

import SwiftUI

struct NoticeCell: View {
    @ObservedObject var notice: Notice
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(notice.title)
                .font(.title2)
                .bold()
                .lineLimit(1)
                .padding(.bottom, 12)
            
            Text(notice.content)
                .font(.body)
                .lineLimit(2)
                .lineSpacing(5)
                .padding(.bottom, 12)
            HStack {
                Text(notice.insertDate, style: .date)
                Text("| 작성자: " + notice.writer)
                
            }.font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(20)
        .padding(.top, 20)
        .padding(.bottom, 20)
        .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg")))
        
    }
}

struct NoticeCell_Previews: PreviewProvider {
    static var previews: some View {
        NoticeCell(notice: Notice(title: "2학기 회비 납부 공지", content:
"""
안녕하세요! 소통부장 동기창입니다!
현재 2학기 회비 납부기간입니다! 9월30일에 마감될 예정이니 2학기 활동 하실 분들 회비 납부하시면 여러 활동들 참가 가능하십니다!

✅ 납부 : 카카오뱅크 3333-22-6132866 임영빈
✅ 회비 : 20000원
✅ 기한 : 9월 30일까지
"""
                                  , insertDate: Date()))
    }
}
