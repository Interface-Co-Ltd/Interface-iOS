//
//  NoticeView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//

import SwiftUI

struct NoticeView: View {
    @State var isLoading = true
    @State var store: [Board]
    
    private let columns = [
        GridItem(.adaptive(minimum: 350, maximum: .infinity), spacing: nil, alignment: .top)
    ]
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading, spacing: 30) {
                    //            LazyVStack {
                    ForEach(store) { board in
                        NavigationLink {
                            NoticeDetailView(notice: board)
                        } label: {
                            NoticeCellView(notice: board)
                        }
                        .navigationTitle("공지사항")
                        .buttonStyle(ScaledButtonStyle())
                        .foregroundColor(.primary)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("공지사항")
        .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
        .background(Color("bkg").ignoresSafeArea())
    }
}



struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView(store: BoardViewModel.preview.boardList!)
    }
}


