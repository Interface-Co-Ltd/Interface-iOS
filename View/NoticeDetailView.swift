//
//  NoticeDetailView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//
import SwiftUI

struct NoticeDetailView: View {
    @State var notice: Board
    
    @Binding var showDetailView: Bool
    
    var safeArea: EdgeInsets
    var size: CGSize
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if #available(iOS 15.0, *) {
                VStack {
                    if let image = notice.images {
                        ArtWork(image: image)
                    }
                    
                    NoticeContentView()
                }
            } else {
                // Fallback on earlier versions
            }
        }
        .coordinateSpace(name: "SCROLL")
        
        .background(Color("bkg").ignoresSafeArea())
        .ignoresSafeArea(notice.images == nil ? [] : .all)
    }
    
    @available(iOS 15.0, *)
    @ViewBuilder
    func ArtWork(image: String) -> some View {
        let height = size.height
        
        GeometryReader { reader in
            let size = reader.size
            let minY = reader.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .clipped()
                .overlay(content: {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(
                                .linearGradient(colors: [
                                    Color("bkg").opacity(0 - progress),
                                    Color("bkg").opacity(0.1 - progress),
                                    Color("bkg").opacity(0.3 - progress),
                                    Color("bkg").opacity(0.5 - progress),
                                    Color("bkg").opacity(0.8 - progress),
                                    Color("bkg").opacity(1)
                                ], startPoint: .top, endPoint: .bottom)
                            )
                        
                        HStack {
                            Text(notice.title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                        }
                        .opacity(1 + (progress > 0 ? -progress : progress))
                        .padding()
                        .offset(y: minY - height / 4 < -height / 4 ? minY - height / 4 : -height / 4)
                    }
                    
                })
                .offset(y: -minY)
                .onChange(of: minY) { newValue in
                    if newValue > 160 {
                        showDetailView = false
                    }
                }
        }
        .frame(height: notice.images != nil ? (height + safeArea.top) : 150)
    }
    
    @ViewBuilder
    func NoticeContentView() -> some View {
        VStack(spacing: 20) {
            let height = size.height
            
            if notice.images == nil {
                GeometryReader { reader in
                    let minY = reader.frame(in: .named("SCROLL")).minY
                    let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
                    
                    HStack {
                        Text(notice.title)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .opacity(1 + (progress > 0 ? -progress : progress))
                        
                        Spacer()
                    }
                    .onChange(of: minY) { newValue in
                        if newValue > 160 {
                            showDetailView = false
                        }
                    }
                    .frame(height: 120)
                }
                
            }
            
            Text(notice.content)
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(y: notice.images != nil ? -height / 4 : 100)
        }
        .padding()
    }
}


struct NoticeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {
            NoticeDetailView(notice: BoardViewModel.preview.boardList![0], showDetailView: .constant(true), safeArea: $0.safeAreaInsets, size: $0.size)
        }
    }
}
