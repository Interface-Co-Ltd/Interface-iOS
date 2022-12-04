//
//  Board.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/27.
//

import Foundation

struct Board: Codable, Identifiable {
    let id = UUID()
        let title, content, type, user: String
        let images: [BoardImage]?
        let createdDate, modifiedDate: Date

        enum CodingKeys: String, CodingKey {
            case id, title, content, type, user, images
            case createdDate = "created_date"
            case modifiedDate = "modified_date"
        }
    
    //게시판 생성 날짜를 "22/11/03 오후 20:13"형태의 문자열로 반환
    func stringCreatedDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy/MM/dd a hh:mm"
        
        return formatter.string(from: self.createdDate)
    }
    
    //게시판 수정 날짜를 "22/11/03 오후 20:13"형태의 문자열로 반환
    func stringModifiedDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy/MM/dd a hh:mm"
        
        return formatter.string(from: self.modifiedDate)
    }
}

struct BoardImage: Codable {
    let uuid, uploadPath, fileName: String
    let boardid: Int
}

//preview용 게시판 모델 생성자 사용시 코드 "Board.preview"
extension Board {
    static var preview: [Board] {
        var data = [Board]()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            guard let jsonData = PreviewNotice.data.data(using: .utf8) else {
                fatalError()
            }
            
            data = try decoder.decode([Board].self, from: jsonData)
        } catch {
            print("공지사항 미리보기 데이터 디코딩 실패")
        }
        
        return data
    }
}
