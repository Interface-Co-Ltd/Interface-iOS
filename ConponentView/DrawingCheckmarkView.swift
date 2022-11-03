//
//  DrawingCheckmarkView.swift
//  PrototypeIF
//
//  Created by 김도형 on 2022/09/13.
//

import SwiftUI

struct DrawingCheckmarkView: View {
    @State private var checkmarkAppear: Bool = false
    
    var body: some View {
        GeometryReader { reader in
            Path { path in
                let width: CGFloat = min(reader.size.width, reader.size.height)
                let height: CGFloat = reader.size.height
                
                path.addLines([
                    .init(x: width / 2 - 10, y: height / 2 - 10),
                    .init(x: width / 2, y: height / 2),
                    .init(x: width / 2 + 20, y: height / 2 - 20)
                ])
            }
            .trim(from: 0, to: checkmarkAppear ? 1 : 0)
            .stroke(style: StrokeStyle(lineWidth: 2.0, lineCap:  .round))
            .animation(Animation.easeIn(duration: 0.4))
            .aspectRatio(1, contentMode: .fit)
            .onAppear {
                self.checkmarkAppear.toggle()
            }
        }
        .frame(width: 50, height: 50)
        .foregroundColor(.green)
    }
}

struct DrawingCheckmarkView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingCheckmarkView()
    }
}
