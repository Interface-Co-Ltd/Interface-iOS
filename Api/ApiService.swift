//
//  ApiService.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/22.
//

import Foundation
import Combine

enum API {
    case fetchBoards
    case fetchSchedules
    case fetchUser
    case fetchCooperations
    
    var url: URL {
        switch self {
            case .fetchBoards:
                return URL(string: "1")!
            case .fetchSchedules:
                return URL(string: "https://637b8bb210a6f23f7fac1c5b.mockapi.io/schedule")!
            case .fetchUser:
                return URL(string: "1")!
            case .fetchCooperations:
                return URL(string: "1")!
        }
    }
}

enum ApiService {
    static func fetchBoards() -> AnyPublisher<[Board], ApiError> {
        //        guard let url = API.fetchBoards.url else {
        //            throw ApiError.invalidUrl(API.fetchBoards.url?.host ?? "")
        //        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: API.fetchBoards.url).tryMap {
            guard let httpResponse = $0.response as? HTTPURLResponse else {
                throw ApiError.invalidResponse
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw ApiError.failed(httpResponse.statusCode)
            }
            
            return $0.data
        }
        .decode(type: [Board].self, decoder: decoder)
        .mapError{ error in
            ApiError.convert(error: error)
        }
        .eraseToAnyPublisher()
    }
    
    static func fetchSchedules() -> AnyPublisher<[Schedule], ApiError> {
//        guard let url = API.fetchSchedules.url else {
//            throw ApiError.invalidUrl("잘못된 URL입니다.")
//        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: API.fetchSchedules.url).tryMap {
            guard let httpResponse = $0.response as? HTTPURLResponse else {
                throw ApiError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw ApiError.failed(httpResponse.statusCode)
            }
            
            return $0.data
        }
        .decode(type: [Schedule].self, decoder: decoder)
        .mapError { error in
            ApiError.convert(error: error)
        }
        .eraseToAnyPublisher()
    }
    
    static func fetchUser() -> AnyPublisher<User, ApiError> {
//        guard let url = API.fetchUser.url else {
//            throw ApiError.invalidUrl("잘못된 URL입니다.")
//        }
        
        return URLSession.shared.dataTaskPublisher(for: API.fetchUser.url).tryMap {
            guard let httpResponse = $0.response as? HTTPURLResponse else {
                throw ApiError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw ApiError.failed(httpResponse.statusCode)
            }
            
            return $0.data
        }
        .decode(type: User.self, decoder: JSONDecoder())
        .mapError { error in
            ApiError.convert(error: error)
        }
        .eraseToAnyPublisher()
    }
    
    static func fetchCooperations() -> AnyPublisher<[Cooperation], ApiError> {
//        guard let url = API.fetchCooperations.url else {
//            throw ApiError.invalidUrl("잘못된 URL입니다.")
//        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: API.fetchCooperations.url).tryMap {
            guard let httpResponse = $0.response as? HTTPURLResponse else {
                throw ApiError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw ApiError.failed(httpResponse.statusCode)
            }
            
            return $0.data
        }
        .decode(type: [Cooperation].self, decoder: decoder)
        .mapError {error in
            ApiError.convert(error: error)
        }
        .eraseToAnyPublisher()
    }
}
