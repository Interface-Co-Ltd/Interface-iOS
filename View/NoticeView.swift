//
//  NoticeView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//

import SwiftUI

struct NoticeView: View {
    @Namespace var heroEffect
    
    @State var store: [Board]
    @State var showDetailView = false
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 35) {
                    ForEach(store) { board in
                        NavigationLink {
                            NoticeDetailView(notice: board)
                        } label: {
                            VStack(alignment: .leading, spacing: 5) {
                                HStack(spacing: 0) {
                                    Text(board.title)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                Text(board.content)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                                    .font(.footnote)
                                Spacer()
                                
                                HStack {
                                    Text(board.stringCreatedDate())
                                    
                                    Text("작성자 : \(board.user)")
                                }
                                .font(.caption2)
                                .foregroundColor(.secondary)
                            }
                            .padding(.all, 25)
                            .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg-accent")))
                LazyVGrid(columns: columns, alignment: .leading, spacing: 30) {
                    ForEach(store) { board in
                        if #available(iOS 15.0, *) {
                            Button {
                                showDetailView.toggle()
                            } label: {
                                NoticeCellView(notice: board)
                            }
                            .buttonStyle(ScaledButtonStyle())
                            .foregroundColor(.primary)
                            
                        } else {
                            NavigationLink {
                                GeometryReader {
                                    NoticeDetailView(notice: board, safeArea: $0.safeAreaInsets, size: $0.size)
                                }
                            } label: {
                                NoticeCellView(notice: board)
                            }
                            .buttonStyle(ScaledButtonStyle())
                            .foregroundColor(.primary)
                        }
                    }
                }
                
                .padding()
            }
        }.navigationTitle("공지사항")
            .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
            .background(Color("bkg").ignoresSafeArea())
//            .redacted(reason: isLoading ? .placeholder : [])
//            .onAppear() {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    isLoading = false
//                }
//            }
    }
}



struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView(store: BoardViewModel.preview.boardList!)
    }
}


