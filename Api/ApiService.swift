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
    
    var url: URL? {
        switch self {
            case .fetchBoards:
                return URL(string: "")
            case .fetchSchedules:
                return URL(string: "https://637b8bb210a6f23f7fac1c5b.mockapi.io/schedule")
            case .fetchUser:
                return URL(string: "")
            case .fetchCooperations:
                return URL(string: "")
        }
    }
}

enum ApiService {
    static func fetchBoards() throws -> AnyPublisher<[Board], Error> {
        guard let url = API.fetchBoards.url else {
            throw ApiError.invalidUrl(API.fetchBoards.url?.host ?? "")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).tryMap {
            guard let httpResponse = $0.response as? HTTPURLResponse else {
                throw ApiError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw ApiError.failed(httpResponse.statusCode)
            }
            
            return $0.data
        }
        .decode(type: [Board].self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
    
    static func fetchSchedules() throws -> AnyPublisher<[Schedule], Error> {
        guard let url = API.fetchSchedules.url else {
            throw ApiError.invalidUrl("잘못된 URL입니다.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: url).tryMap {
            guard let httpResponse = $0.response as? HTTPURLResponse else {
                throw ApiError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw ApiError.failed(httpResponse.statusCode)
            }
            
            return $0.data
        }
        .decode(type: [Schedule].self, decoder: decoder)
        .eraseToAnyPublisher()
    }
    
    static func fetchUser() throws -> AnyPublisher<User, Error> {
        guard let url = API.fetchUser.url else {
            throw ApiError.invalidUrl("잘못된 URL입니다.")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).tryMap {
            guard let httpResponse = $0.response as? HTTPURLResponse else {
                throw ApiError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw ApiError.failed(httpResponse.statusCode)
            }
            
            return $0.data
        }
        .decode(type: User.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
    
    static func fetchCooperations() throws -> AnyPublisher<[Cooperation], Error> {
        guard let url = API.fetchCooperations.url else {
            throw ApiError.invalidUrl("잘못된 URL입니다.")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).tryMap {
            guard let httpResponse = $0.response as? HTTPURLResponse else {
                throw ApiError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw ApiError.failed(httpResponse.statusCode)
            }
            
            return $0.data
        }
        .decode(type: [Cooperation].self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}
