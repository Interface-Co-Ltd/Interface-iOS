//
//  ScaledButtonStyle.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/22.
//  버튼 클릭 효과 지정

import Foundation
import SwiftUI

struct ScaledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.93 : 1)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}
