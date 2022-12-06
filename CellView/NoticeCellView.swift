//
//  NoticeCellView.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/12/05.
//

import SwiftUI

struct NoticeCellView: View {
    @Environment(\.colorScheme) var displayMode
    
    @State var notice: Board
    
    var body: some View {
        ZStack {
            if let image = notice.images {
                Group {
                    GeometryReader { reader in
                        ZStack {
                            Image(image)
                                .resizable()
                                .scaledToFill()
                        }
                    }
                    .clipped()
                    
                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color("bkg").opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                
                if notice.images != nil {
                    Spacer()
                }
                
                HStack(spacing: 0) {
                    Text(notice.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                
                if notice.images == nil {
                    Text(notice.content)
                        .multilineTextAlignment(.leading)
                        .lineLimit(4)
                        .font(.footnote)
                }
                
                HStack {
                    Text(notice.stringCreatedDate())
                    
                    Text("작성자 : \(notice.user)")
                }
                .font(.caption2)
            }
            .padding(notice.images == nil ? 25 : 15)
        }
        .frame(minHeight: notice.images != nil ? 200 : 0)
        .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg")))
    }
}

struct NoticeCellView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeCellView(notice: BoardViewModel.preview.boardList![0])
    }
}
