//
//  Cooperation.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/10/07.
//

import Foundation

struct Cooperation: Codable, Identifiable {
    let id = UUID()
    var favorites: [UUID: Bool]?
    var favoriteCount: Int?
    
    let name: String
    let link: String
    let address: String
}

//preview용 추천맛집 모델 리스트 생성자 사용시 코드 "Cooperation.preview"
extension Cooperation {
    static var preview: [Cooperation] {
        var data = [Cooperation]()
        
        do {
            guard let jsonData = PreviewCooperation.data.data(using: .utf8) else {
                fatalError()
            }
            
            data = try JSONDecoder().decode([Cooperation].self, from: jsonData)
        } catch {
            print("맛집 추천 미리보기 데이터 디코딩 실패")
        }
        
        return data
    }
}
