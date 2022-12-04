//
//  PreviewNotice.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/12/04.
//

import Foundation

struct PreviewNotice {
    static let data = """
[
    {
        "title": "돕바 공구 안내",
        "content": "안녕하세요! 소통 부장 동기창입니다.\\n\\n이제 곧 겨울이 다가와서 저희 동아리에서 굿즈(?)를 준비했습니다!\\n\\n바로바로\\n\\n돕바(롱페딩)!!\\n\\n✅ 가격 : 70,000원\\n✅ 조사 : 22.11.12(토) 23:59 까지\\n✅ 색상 : 검정색, 흰색\\n\\n보다 정확한 디자인을 확인 하실라면 신청폼을 통해 확인해 보세요!\\n\\n✅ 신청폼 :https://forms.gle/8Pqp1S9ovgeRSvQh8\\n\\n⚠️ 조사가 마감된 후 주문취소(환불), 인원추가 및 사이즈변경이 불가능합니다!\\n\\n기타 문의 사항은 소통 부장 동기창한테 카톡 주세요!\\n감사합니다!",
        "type": "공지",
        "user": "동기창",
        "images": [
            {
                "uuid": "dd6959f6-a77f-4ea4-9177-562e7ad82751",
                "uploadPath": "src/main/resources/static/images/20221128/286634019283083.jpg",
                "fileName": "고구마.jpeg",
                "boardid": 1
            },
            {
                "uuid": "f13fd905-6e47-4cd2-bf3e-a1c6cdd65901",
                "uploadPath": "src/main/resources/static/images/20221128/286634014960583.jpg",
                "fileName": "바나나.jpeg",
                "boardid": 1
            }
        ],
        "created_date": "2022-11-09T21:57:00.000000",
        "modified_date": "2022-11-09T21:57:00.000000"
    },
    {
        "title": "인터페이스 차기 회장 선거 안내",
        "content": "안녕하세요! 소통부장 동기창입니다!\\n\\n어느덧 22년 2학기도 얼마 안남았네요… 디귿\\n그래서 2023년도 회장 선거를 하는 시기가 왔습니다!\\n\\n⭐️ 36기 회장 후보 등록\\n✅ 후보자 등록 기간 : 11월 24일(목) ~ 11월 29일(화)\\n✅ 신청 자격 : 인터페이스 회칙 제 13조(임원 선출) 제1항을 충족하는 자\\n제1항. 회장은 2학기 이상 수료 예정자로 회원 7인 이상의 추천으로 후보로 등록되며 신입회원,\\n정회원 과반 수 이상의 출석 중 출석 회원 과반수의 찬성으로 선출한다.\\n(단 당선자가 없을 경우는 득표가 높은 후보 2명을 재투표하여 선출하며 그래도 없을 경우 최고득표자를 당선자로 한다).\\n✅ 회장 후보 등록폼 : https://forms.gle/tu5WtV8mWiRUobs36\\n\\n⭐️ 36기 회장 선출 투표\\n✅ 투표 일시 : 12월 2일(금) 18시 30분\\n✅ 장소 : 대양AI센터 B103호\\n✅ 참가 신청 기간 : 11월 24일(목) ~ 11월 29일(화)\\n✅ 참가 신청 폼 : https://forms.gle/YUg8oNcWZb2fcMbd9\\n\\n⭐️회장 선출 투표 끝나고 뒷풀이가 있습니다!\\n✅ 참가비 : 15,000원\\n✅ 참가 신청 폼은 회장 선출 투표 참가 폼에 같이 있습니다.",
        "type": "공지",
        "user": "동기창",
        "images": [],
        "created_date": "2022-11-24T22:49:00.000000",
        "modified_date": "2022-11-24T22:49:00.000000"
    },
    {
        "title": "2022 인터페이스 프로그래밍 전시회 안내",
        "content": "안녕하세요! 소통부장 동기창입니다!\\n12월 1일(목),(금) 2일동안 오전 10시부터 오후 5시까지 쎈 지하 1층이랑 광토 1층에서 저희 인터페이스에서 한학기동안 준비한 프로그램을 전시합니다!\\n쎈이랑 광토랑 다른 전시를 전시를 합니다!\\n오랜기간동안 준비한 전시회인만큼 많은 관심 부탁드립니다!\\n감사합니다!",
        "type": "공지",
        "user": "동기창",
        "images": [],
        "created_date": "2022-11-30T22:48:00.000000",
        "modified_date": "2022-11-30T22:48:00.000000"
    }
]
"""
}

struct PreviewSchedule {
    static let data = """
[
    {
            "div": "인터페이스",
            "content": "개강총회",
            "start_date": "2022-09-02T00:00:00+09:00",
            "end_date": "2022-09-02T00:00:00+09:00",
            "all_day": 1
    },
    {
            "div": "인터페이스",
            "content": "회비납부 마감",
            "start_date": "2022-09-30T00:00:00+09:00",
            "end_date": "2022-09-30T00:00:00+09:00",
            "all_day": 1
    },
    {
            "div": "세종대학교",
            "content": "중간고사",
            "start_date": "2022-10-20T00:00:00+09:00",
            "end_date": "2022-10-26T00:00:00+09:00",
            "all_day": 1
    },
    {
            "div": "세종대학교",
            "content": "중간고사 성적열람 및 정정",
            "start_date": "2022-11-01T00:00:00+09:00",
            "end_date": "2022-11-06T00:00:00+09:00",
            "all_day": 1
    },
    {
            "div": "세종대학교",
            "content": "공대 학생예비군",
            "start_date": "2022-11-01T00:00:00+09:00",
            "end_date": "2022-11-04T00:00:00+09:00",
            "all_day": 1
    },
    {
            "div": "인터페이스",
            "content": "인터페이스 창립제",
            "start_date": "2022-11-19T00:00:00+09:00",
            "end_date": "2022-11-19T00:00:00+09:00",
            "all_day": 1
    },
    {
            "div": "인터페이스",
            "content": "2022 프로그래밍 전시회",
            "start_date": "2022-12-01T00:00:00+09:00",
            "end_date": "2022-12-02T00:00:00+09:00",
            "all_day": 1
    },
    {
            "div": "세종대학교",
            "content": "계절학기 수강신청",
            "start_date": "2022-12-01T00:00:00+09:00",
            "end_date": "2022-12-05T00:00:00+09:00",
            "all_day": 1
    },
    {
            "div": "세종대학교",
            "content": "기말고사",
            "start_date": "2022-12-15T00:00:00+09:00",
            "end_date": "2022-12-21T00:00:00+09:00",
            "all_day": 1
    },
    {
            "div": "세종대학교",
            "content": "기말고사 성적열람 및 정정",
            "start_date": "2022-12-27T00:00:00+09:00",
            "end_date": "2023-01-01T00:00:00+09:00",
            "all_day": 1
    },
    {
            "div": "세종대학교",
            "content": "기말고사 성적마감",
            "start_date": "2023-01-02T00:00:00+09:00",
            "end_date": "2023-01-03T00:00:00+09:00",
            "all_day": 1
    }
]
"""
}

struct PreviewCooperation {
    static let data = """
[
    {
        "id": 6,
        "name": "공민성",
        "address": "address",
        "link": "https://m.place.naver.com/my/place/detailList/d4d3e1a444664b69a58548af8d5b8c1b?close%27"
    }
]
"""
}

struct PreviewUser {
    static let data = """
    {
        "studentId": "19010769",
        "name": "권하윤",
        "email": "cupertino88@gmail.com",
        "auth": "ROLE_ADMIN",
        "phone": "010-9457-0043",
        "birthday": "98-03-08"
    }
"""
}

