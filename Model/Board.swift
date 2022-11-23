//
//  Board.swift
//  PrototypeIF2.0
//
//  Created by 김도형 on 2022/09/27.
//

import Foundation

struct Board: Codable, Identifiable {
    var id = UUID()
    
    let title: String
    var content: String
    let createdDate: Date
    let modifiedDate: Date
    let userID: String
    
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

//preview용 게시판 모델 생성자 사용시 코드 "Board.preview"
extension Board {
    static var preview: Board {
        var cdt: Date
        var mdt: Date
        var randomIndex: Int
        
        let randomTitle = ["2학기 사물함 배정", "가을 엠티 수요조사", "2022 인터페이스 상영행사", "2학기 회비 관련 공지"]
        let randomContent = [
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
            """,
            
            """
            안녕하세요 35기 소통부장 동기창입니다!
            
            다름이 아니라 이번에 가을MT를 가려고 기획하고 있습니다!! (짝짝짝)
            
            이에 따라 수요조사를 진행할 예정입니다. (대략적인 인원파악을 위한 용도입니다. 정확한 참여여부 조사는 추후 공지를 통해 말씀드리겠습니다.)
            MT 기간은 중간고사 끝나고 11월 첫째주 7-8일(토~일) 1박 2일, 대성리로 갈 예정입니다!
            회비를 납부하신 분들의 참가비는 25000원일 예정입니다. (회비 미납부자는 35000원입니다!)
            참가를 희망하시는 분들은 아래 기수별 이모티콘을 눌러주시면 감사하겠습니다! (본인 기수는 본인 프로필 누르시면 확인 가능합니다!)
            (올해 입부하신분들은 신입생 톡방에서 투표 부탁드립니다!)
            
            MT관련 문의는 동기창을 찾아주세요!
            """,
            
            """
            안녕하세요! 소통부장 동기창입니다!

            중간고사 시작전에 자그마한 행사 준비했어요!

            바로바로 2022 인터페이스 첫번째 🎥상영행사🍿입니다!👏👏👏

            ✅영화 : (힌트)토룩투 막토??
            ✅ 장소 : 율곡관 201호
            ✅ 일시 : 9/28(수) 오후 6시
                           (5시 30분부터 입장가능)

            🚨상영행사가 끝나고 동방에서 간단히 뒤풀이를 진행합니다!!
            🚨상영행사를 참여하지 않으시고 뒤풀이만 참여 가능합니다(뒤풀이 시간은 9시쯤부터 진행될 예정입니다)
            🚨뒤풀이만 참여한다고 하신분들 중 참여가 안되시는 분들은 당일(9/28) 오후7시전까지 🔥꼭🔥알려주세요!

            상영행사 및 뒤풀이 참여여부는 아래 링크를 통해 신청해주세요!
            참석여부답변은 9/27(화) 오후8시까지만 받겠습니다
            🔻
            https://forms.gle/LrXGCX77ot3MrhkL8
            """,
            
            """
            안녕하세요! 소통부장 동기창입니다!

            2학기 회비 관련해서 공지드립니다!

            ✅ 회비 : 20000원
            ✅ 대상 : 신입생 & 재학생
            ✅ 날짜 : 9월 30일까지
            ✅ 계좌 : 카카오뱅크 3333226132866 임영빈
             ⭐️ 입금하실 때 기수&이름 으로 입금 부탁드립니다!
                   Ex) 35기 김인페

            회비는 인터페이스 동아리가 2학기 동안 진행할 여러 활동들에 쓰일 예정입니다.

            ⭐️ 2학기에 진행될 모든 활동들은 2학기 회비 납부자에 한하여 활동 가능합니다.

            2학기 진행 활동은

            ✅ 프로그래밍 전시회 (진행중)
            ✅ 창립제 (선배님들과 교류하는 행사)

            2학기 진행 계획 중인 활동은

            ✅ 게임대회 (테트리스, 롤, 루미큐브, 폴가이즈 등)
            ✅ 상영행사 (할로윈 영화 상영, 월드컵 경기 상영 등)

            이 외에도 다양한 행사 진행 예정입니다!

            ⭐️ 회비 납부 확인 후 인터페이스 단체톡방에 초대해 드리겠습니다.

            감사합니다!
            """
        ]
        
        if #available(iOS 15.0, *) {
            cdt = Date.now.addingTimeInterval(TimeInterval(3600 * 24 * Int.random(in: -7..<1) - Int.random(in: 0..<3600 * 24)))
        } else {
            cdt = NSDate.now as Date
            cdt.addTimeInterval(TimeInterval(3600 * 24 * Int.random(in: -7..<1) - Int.random(in: 0..<3600 * 24)))
        }
        
        mdt = cdt.addingTimeInterval(TimeInterval(3600 * 24 * Int.random(in: 0...1)))
        randomIndex = Int.random(in: 0..<4)
        
        return Board(title: randomTitle[randomIndex], content: randomContent[randomIndex], createdDate: cdt, modifiedDate: mdt, userID: "동기창")
    }
}
