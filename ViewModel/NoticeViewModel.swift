//
//  NoticeStore.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/02.
//

import Foundation

class NoticeViewModel: ObservableObject {
    @Published var list: [Notice]   // binding view auto update
    
    init() {
        list = [
            Notice(title: "2학기 회비 납부 공지", content:
                    """
                    안녕하세요! 소통부장 동기창입니다!
                    현재 2학기 회비 납부기간입니다! 9월30일에 마감될 예정이니 2학기 활동 하실 분들 회비 납부하시면 여러 활동들 참가 가능하십니다!
                    
                    ✅ 납부 : 카카오뱅크 3333-22-6132866 임영빈
                    ✅ 회비 : 20000원
                    ✅ 기한 : 9월 30일까지
                    """
                   
                   , insertDate: Date()),
            
            Notice(title: "사물함 배정 공지", content:
                    """
                    안녕하세요! 소통부장 동기창입니다!
                    저희 동아리방에 있는 사물함을 배정할려고 합니다!
                    ✅ 배정 가능한 사물함 갯수는 정리 후 추후 말씀 드리겠습니다!
                    ✅ 사물함 배정은 2학기 회비 납부하신 분들에 한해 신청 가능하십니다!
                    ✅ 신청은 선착순으로 진행 됩니다!
                    ✅ 사물함 신청폼은 이번주 목요일(9월 8일) 오후 8시에 열립니다! 신청폼은 공지된 시간에 알려드리겠습니다!
                    ✅ 사물함 배정 결과는 추석 후 개인적으로 공지해 드리겠습니다!
                    ✅ 사물함 사용은 2학기 종강(12월 21일)까지 가능합니다!
                    
                    추가적으로 궁금한 점들은 바로바로 갠톡 보내주세요!
                    
                    감사합니다!
                    """
                   
                   , insertDate: Date().addingTimeInterval(3600 * -24)),
            
            Notice(title: "개강총회 및 뒷풀이 참가 조사", content:
                    """
                    2학기 개강총회 및 뒷풀이 참가 조사 링크 입니다!
                    동아리 회칙에 따라 동아리원분들은 개강총회, 종강총회 둘 중 최소 한번 이상 참가하셔야 합니다!
                    """
                   
                   , insertDate: Date().addingTimeInterval(3600 * -24)),
            Notice(title: "개강총회 및 뒷풀이 참가 조사", content:
                    """
                    2학기 개강총회 및 뒷풀이 참가 조사 링크 입니다!
                    동아리 회칙에 따라 동아리원분들은 개강총회, 종강총회 둘 중 최소 한번 이상 참가하셔야 합니다!
                    """
                   
                   , insertDate: Date().addingTimeInterval(3600 * -24)),
            Notice(title: "개강총회 및 뒷풀이 참가 조사", content:
                    """
                    2학기 개강총회 및 뒷풀이 참가 조사 링크 입니다!
                    동아리 회칙에 따라 동아리원분들은 개강총회, 종강총회 둘 중 최소 한번 이상 참가하셔야 합니다!
                    """
                   
                   , insertDate: Date().addingTimeInterval(3600 * -24)),
            Notice(title: "개강총회 및 뒷풀이 참가 조사", content:
                    """
                    2학기 개강총회 및 뒷풀이 참가 조사 링크 입니다!
                    동아리 회칙에 따라 동아리원분들은 개강총회, 종강총회 둘 중 최소 한번 이상 참가하셔야 합니다!
                    """
                   
                   , insertDate: Date().addingTimeInterval(3600 * -24)),
            Notice(title: "개강총회 및 뒷풀이 참가 조사", content:
                    """
                    2학기 개강총회 및 뒷풀이 참가 조사 링크 입니다!
                    동아리 회칙에 따라 동아리원분들은 개강총회, 종강총회 둘 중 최소 한번 이상 참가하셔야 합니다!
                    """
                   
                   , insertDate: Date().addingTimeInterval(3600 * -24))
        ]
    }
    
    func insert(title: String, content: String) {
        list.insert(Notice(title: title, content: content), at: 0)
    }
    
    func update(notice: Notice?, title: String, content: String) {
        guard let notice = notice else {
            return
        }
        notice.title = title
        notice.content = content
    }
    
    func delete(notice: Notice) {
        list.removeAll{ $0.id == notice.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
