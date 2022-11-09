//
//  RestaurantStore.swift
//  Interface-Co-Ltd
//
//  Created by 안수경 on 2022/11/03.
//

import Foundation

class RecommendedRestaurantModel: ObservableObject {
    @Published var list: [RecommendedRestaurant]   // binding view auto update
    
    init() {
        list = [
            RecommendedRestaurant(title: "컴포즈커피 세종대점",
                       category: "디저트",
                       content: "와플이 맛있어요🤤",
                       location: "서울 광진구 능동로 195-16 김원관 1층",
                       phone: "02-2088-7131",
                       operatingTime:
                        """
                        월  08:00 - 23:00
                        화  08:00 - 23:00
                        수  08:00 - 23:00
                        목  08:00 - 23:00
                        금  08:00 - 23:00
                        토  08:00 - 23:00
                        일  08:00 - 23:00
                        """,
                       menu:
                        [
                            ("아메리카노", "1,500"),
                            ("카페라떼", "2,500"),
                            ("밀크티", "3,800"),
                            ("그린티라떼", "3,500"),
                            ("플레인요거트스무디", "3,500"),
                            ("허니자몽티", "3,500"),
                            ("레몬에이드", "3,500")
                        ]
                      ),
            
            RecommendedRestaurant(title: "스시붐",
                       category: "일식",
                       content: "따연초 맛집",
                       location: "서울 광진구 광나루로17길 14-5",
                       phone: "02-466-6077",
                       operatingTime:
                        """
                        월
                        11:30 - 20:00
                        15:00 - 16:30 브레이크타임
                        19:30 라스트오더
                        화
                        11:30 - 20:00
                        15:00 - 16:30 브레이크타임
                        19:30 라스트오더
                        수
                        11:30 - 20:00
                        15:00 - 16:30 브레이크타임
                        19:30 라스트오더
                        목
                        11:30 - 20:00
                        15:00 - 16:30 브레이크타임
                        19:30 라스트오더
                        금
                        11:30 - 20:00
                        15:00 - 16:30 브레이크타임
                        19:30 라스트오더
                        토
                        12:00 - 20:00
                        15:00 - 16:30 브레이크타임
                        19:30 라스트오더
                        일
                        정기휴무 (매주 일요일)
                        """,
                       menu:
                        [
                            ("따뜻한 연어초밥 8pcs", "12,000")
                            
                        ]
                      ),
            
            RecommendedRestaurant(title: "미식반점",
                       category: "중식",
                       content: "동글동글 탕후루 탕수육이 맛있는 중식당",
                       location: "서울 광진구 군자로 70 1층",
                       phone: "0507-1492-2020",
                       operatingTime:
                        """
                        월
                        11:30 - 22:00
                        15:00 - 17:00 브레이크타임
                        14:30 라스트오더
                        화
                        11:30 - 22:00
                        15:00 - 17:00 브레이크타임
                        14:30 라스트오더
                        수
                        11:30 - 22:00
                        15:00 - 17:00 브레이크타임
                        14:30 라스트오더
                        목
                        11:30 - 22:00
                        15:00 - 17:00 브레이크타임
                        14:30 라스트오더
                        금
                        11:30 - 22:00
                        15:00 - 17:00 브레이크타임
                        14:30 라스트오더
                        토
                        11:30 - 22:00
                        15:00 - 17:00 브레이크타임
                        14:30 라스트오더
                        일
                        11:30 - 22:00
                        15:00 - 17:00 브레이크타임
                        14:30 라스트오더
                        
                        - 밤9시 주문마감
                        """,
                       menu:
                        [
                            ("탕후루탕수육(소)", "15,000"),
                            ("탕후루탕수육(중)", "20,000"),
                            ("미식짜장면(1인분)", "6,500"),
                            ("미식짜장면(곱배기)", "7,500"),
                            ("해물짬뽕(1인분)", "8,000"),
                            ("해물짬뽕(곱배기)", "9,000"),
                            ("미식볶음밥(1인분)", "7,000"),
                            ("미식볶음밥(곱배기)", "8,500")
                        ]
                      ),
            RecommendedRestaurant(title: "방이샤브샤브칼국수 세종대점",
                       category: "기타",
                       content: "야채 듬뿍 고기 듬뿍",
                       location: "서울 광진구 군자로 106 1층",
                       phone: "0507-1404-0365",
                       operatingTime:
                        """
                        월
                        11:00 - 21:00
                        14:30 - 17:30 브레이크타임
                        13:30, 20:00 라스트오더
                        화
                        11:00 - 21:00
                        14:30 - 17:30 브레이크타임
                        13:30, 20:00 라스트오더
                        수
                        11:00 - 21:00
                        14:30 - 17:30 브레이크타임
                        13:30, 20:00 라스트오더
                        목
                        11:00 - 21:00
                        14:30 - 17:30 브레이크타임
                        13:30, 20:00 라스트오더
                        금
                        11:00 - 21:00
                        14:30 - 17:30 브레이크타임
                        13:30, 20:00 라스트오더
                        토
                        정기휴무 (매주 토요일)
                        일
                        정기휴무 (매주 일요일)
                        
                        """,
                       menu:
                        [
                            ("샤브세트", "12,000")
                        ]
                      ),
            RecommendedRestaurant(title: "뱃놈",
                       category: "기타",
                       content: "웨이팅을 감수할만한 어린이대공원 조개구이 맛집",
                       location: "서울 광진구 광나루로19길 9 1층",
                       phone: "010-5603-9282",
                       operatingTime:
                        """
                        월
                        15:00 - 24:00
                        22:30 라스트오더
                        화
                        15:00 - 24:00
                        22:30 라스트오더
                        수
                        15:00 - 24:00
                        22:30 라스트오더
                        목
                        15:00 - 24:00
                        22:30 라스트오더
                        금
                        15:00 - 24:00
                        22:30 라스트오더
                        토
                        13:00 - 23:30
                        22:00 라스트오더
                        일
                        정기휴무 (매주 일요일)
                        """,
                       menu:
                        [
                            ("뱃놈 조개구이 2인", "46,900"),
                            ("뱃놈 조개구이 3인", "63,900"),
                            ("뱃놈 조개찜 2인", "46,900"),
                            ("뱃놈 조개찜 3인", "63,900"),
                            ("뱃놈 조개구이 4인", "79,900"),
                            ("뱃놈 조개찜 4인", "79,900"),
                        ]
                      )
        ]
    }
    
    func insert(title: String, category: String, content: String, location: String, phone: String, operatingTime: String, menu: Array<(String, String)>) {
        list.insert(RecommendedRestaurant(title: title, category: category, content: content, location: location, phone: phone, operatingTime: operatingTime, menu: menu), at: 0)
    }
    
    func update(recommendedRestaurant: RecommendedRestaurant?, title: String, category: String, content: String, location: String, phone: String, operatingTime: String, menu: Array<(String, String)>) {
        guard let recommendedRestaurant = recommendedRestaurant else {
            return
        }
        recommendedRestaurant.content = content
        recommendedRestaurant.category = category
        recommendedRestaurant.title = title
        recommendedRestaurant.location = location
        recommendedRestaurant.phone = phone
        recommendedRestaurant.operatingTime = operatingTime
        recommendedRestaurant.menu = menu
    }
    
    func delete(recommendedRestaurant: RecommendedRestaurant) {
        list.removeAll{ $0.id == recommendedRestaurant.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
