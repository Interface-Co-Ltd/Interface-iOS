//
//  CooperationService.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/07.
//  

import Foundation
import SwiftUI

class CooperationViewModel: ObservableObject {
    @Published var cooperations: [Cooperation] = []
    
    init() {
        cooperations.append(Cooperation(cooperationName: "능동타코집", cooperationAddress: "서울 광진구 능동로32길 5 1층", cooperationLink: URL(string: "https://place.map.kakao.com/m/1756087796?service=search_m") ?? nil, createdDate: "22/10/28", modifiedDate: "22/10/28"))
        
        cooperations.append(Cooperation(cooperationName: "또래끼리", cooperationAddress: "서울 광진구 군자로 103", cooperationLink: URL(string: "https://place.map.kakao.com/m/19183006") ?? nil, createdDate: "22/10/28", modifiedDate: "22/10/28"))
        
        cooperations.append(Cooperation(cooperationName: "스시노칸도 어린이대공원점", cooperationAddress: "서울 광진구 광나루로 369 광진두산위브파크 2층 201호", cooperationLink: URL(string: "https://place.map.kakao.com/m/1209414005") ?? nil, createdDate: "22/10/28", modifiedDate: "22/10/28"))
    }
}
