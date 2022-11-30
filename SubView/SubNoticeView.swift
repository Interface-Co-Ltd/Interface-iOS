//
//  SubNoticeView.swift
//  InterfaceCoLtd
//
//  Created by 안수경 on 2022/11/10.
//

import SwiftUI

struct SubNoticeView: View {
    @State var store: [Board]
    
    var body: some View {
        VStack {
            HStack {
                Text("필독! 인페 공지")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .unredacted()
                Spacer()
            }
            .padding(.leading)
            
            VStack(alignment: .leading, spacing: 20) {
                
                ForEach(store[0...1]) { item in
                    HStack {
                        VStack(alignment: .leading) {
//                            let notice: Board = (store.first)!
                            Text(item.title)
                                .bold()
                                .font(.subheadline)
                                .lineLimit(1)
                                .padding(.bottom, 1)
                            HStack {
                                Text(item.createdDate, style: .date)
                                Text("| 작성자: " + item.user)
                                
                            }.font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                }
                
            }
            .padding(.all, 25)
            .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg-accent")))
        }
    }
}

struct SubNoticeView_Previews: PreviewProvider {
    static var previews: some View {
        SubNoticeView(store: BoardViewModel.preview.boardList!)
    }
}
