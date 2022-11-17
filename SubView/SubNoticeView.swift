//
//  SubNoticeView.swift
//  InterfaceCoLtd
//
//  Created by 안수경 on 2022/11/10.
//

import SwiftUI

struct SubNoticeView: View {
    @EnvironmentObject var store: NoticeViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("필독! 인페 공지")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.leading)
            
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    VStack(alignment: .leading) {
                        let notice: Notice = (store.list.first)!
                        Text(notice.title)
                            .bold()
                            .lineLimit(1)
                            .padding(.bottom, 1)
                        HStack {
                            Text(notice.insertDate, style: .date)
                            Text("| 작성자: " + notice.writer)
                            
                        }.font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        let notice: Notice = store.list[store.list.index(after: store.list.startIndex)]
                        Text(notice.title)
                            .bold()
                            .lineLimit(1)
                            .padding(.bottom, 1)
                        HStack {
                            Text(notice.insertDate, style: .date)
                            Text("| 작성자: " + notice.writer)
                            
                        }.font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                
            }
            .padding(.all, 25)
            .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg-accent")))
        }
    }
}

struct SubNoticeView_Previews: PreviewProvider {
    static var previews: some View {
        SubNoticeView().environmentObject(NoticeViewModel())
    }
}
