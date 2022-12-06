//
//  NoticeDetailView.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//

import SwiftUI

struct NoticeDetailView: View {
    @State var notice: Board
    
    var safeArea: EdgeInsets
    var size: CGSize
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if #available(iOS 15.0, *) {
                VStack {
                    ArtWork()
                    
                    AlbumView()
                }
//                .overlay(alignment: .top) {
//                    HeaderView()
//                }
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
    func ArtWork() -> some View {
        let height = size.height
        
        GeometryReader { reader in
            let size = reader.size
            let minY = reader.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            if let image = notice.images {
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
<<<<<<< Updated upstream
                        Spacer(minLength: 0)
                    }
                    HStack {
                        Text(notice.createdDate, style: .date)
                        Text("| 작성자: " + notice.user)
                        Spacer()
                    }.font(.footnote)
                        .foregroundColor(.secondary)
                        .padding()
=======
                            .offset(y: minY - 200 < -200 ? minY - 200 : -200)
                        }
                    })
                    .offset(y: -minY)
            }
        }
        .frame(height: notice.images != nil ? (height + safeArea.top) : 150)
    }
    
    @ViewBuilder
    func AlbumView() -> some View {
        VStack(spacing: 20) {
            if notice.images == nil {
                HStack {
                    Text(notice.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
>>>>>>> Stashed changes
                }
            }
            Text(notice.content)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(15)
        .offset(y: -200)
    }
    
    @available(iOS 15.0, *)
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { reader in
            let minY = reader.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.65
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            let titleProgress = minY / height
            
            HStack(spacing: 15) {
                Spacer()
            }
            .overlay(content: {
                Text(notice.title)
                    .fontWeight(.semibold)
                    .offset(y: -titleProgress > 0.65 ? 0 : 45)
                    .clipped()
                    .animation(.easeInOut(duration: 0.25), value: -titleProgress > 0.75)
            })
            .padding(.top, safeArea.top + 10)
            .padding([.horizontal, .bottom], 15)
            .background(content: {
                Color("bkg").opacity(-progress > 1 ? 1 : 0)
            })
            .offset(y: -minY)
        }
        .frame(height: 35)
    }
    
}


struct NoticeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {
            NoticeDetailView(notice: BoardViewModel.preview.boardList![0], safeArea: $0.safeAreaInsets, size: $0.size)
        }
    }
}
