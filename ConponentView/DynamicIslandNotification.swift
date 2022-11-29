//
//  DynamicIslandNotification.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/29.
//

import SwiftUI

@available(iOS 15.0, *)
struct DynamicIslandNotification: View {
    var size: CGSize
    @State var show: Bool = false
    
    var body: some View {
        HStack {
            
        }
        .frame(width: show ? size.width - 22 : 126, height: show ? 100 : 37.33)
        .background {
            RoundedRectangle(cornerRadius: show ? 50 : 63, style: .continuous)
                .fill(.black)
        }
        .offset(y: 11)
        .onAppear {
            withAnimation(.easeInOut(duration: 3)) {
                show = true
            }
        }
    }
}

//struct DynamicIslandNotification_Previews: PreviewProvider {
//    static var previews: some View {
//        DynamicIslandNotification(size: <#T##CGSize#>)
//    }
//}
