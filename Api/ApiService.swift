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
    case fetchLogin
    
    var url: URL {
        switch self {
            case .fetchBoards:
                return URL(string: "")!
            case .fetchSchedules:
                return URL(string: "http://3.39.180.85:8080/api/v1/schedule")!
            case .fetchUser:
                return URL(string: "")!
            case .fetchCooperations:
                return URL(string: "")!
            case .fetchLogin:
                return URL(string: "http://3.39.180.85:8080/api/v1/auth/login")!
        }
    }
}

enum AuthenticationErorr: Error, CustomStringConvertible {
    case unknown(Error)
    case invalidUrl(URLError?)
    case invalidCredentials
    case custom(errorMessage: String)
    
    static func convert(error: Error) -> AuthenticationErorr {
        switch error {
            case is URLError: return .invalidUrl(error as? URLError)
            case is AuthenticationErorr: return error as! AuthenticationErorr
            default:
                return .unknown(error)
        }
    }
    
    var description: String {
        return ""
    }
}

enum ApiService {
    static func fetchBoards(token: String) -> AnyPublisher<[Board], ApiError> {
        var request = URLRequest(url: API.fetchUser.url)
        request.addValue(token, forHTTPHeaderField: "JWT")
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: request).tryMap {
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
    
    static func fetchSchedules(token: String) -> AnyPublisher<[Schedule], ApiError> {
        var request = URLRequest(url: API.fetchSchedules.url)
        request.addValue(token, forHTTPHeaderField: "JWT")
    
        
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: request).tryMap {
            guard let httpResponse = $0.response as? HTTPURLResponse else {
                throw ApiError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw ApiError.failed(httpResponse.statusCode)
            }
            
            return $0.data
        }
        .decode(type: [Schedule].self, decoder: JSONDecoder())
        .mapError { error in
            ApiError.convert(error: error)
        }
        .eraseToAnyPublisher()
    }
    
    static func fetchNoneDateSchedules(token: String) -> AnyPublisher<[NoneDateSchedule], ApiError> {
        var request = URLRequest(url: API.fetchSchedules.url)
        request.addValue(token, forHTTPHeaderField: "JWT")
        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: request).tryMap {
            guard let httpResponse = $0.response as? HTTPURLResponse else {
                throw ApiError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw ApiError.failed(httpResponse.statusCode)
            }
            
            return $0.data
        }
        .decode(type: [NoneDateSchedule].self, decoder: JSONDecoder())
        .mapError { error in
            ApiError.convert(error: error)
        }
        .eraseToAnyPublisher()
    }
    
    static func fetchUser(token: String) -> AnyPublisher<User, ApiError> {
        var request = URLRequest(url: API.fetchUser.url)
        request.addValue(token, forHTTPHeaderField: "JWT")
        
        return URLSession.shared.dataTaskPublisher(for: request).tryMap {
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

    static func fetchCooperations(token: String) -> AnyPublisher<[Cooperation], ApiError> {
        var request = URLRequest(url: API.fetchUser.url)
        request.addValue(token, forHTTPHeaderField: "JWT")
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: request).tryMap {
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
    
    static func fetchLogin(studentID: String, password: String, fcmToken: String) -> AnyPublisher<LoginResponse, AuthenticationErorr> {
        let body = LoginRequest(studentId: studentID, password: password, fcmToken: fcmToken)
        
        print(body)
        
        var request = URLRequest(url: API.fetchLogin.url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        return URLSession.shared.dataTaskPublisher(for: request).tryMap {
            guard let httpResponse = $0.response as? HTTPURLResponse else {
                throw AuthenticationErorr.invalidCredentials
            }

            guard httpResponse.statusCode == 200 else {
                throw AuthenticationErorr.invalidCredentials
            }
            print(request)
            
            return $0.data
        }
        .decode(type: LoginResponse.self, decoder: JSONDecoder())
        .mapError { error in
            AuthenticationErorr.convert(error: error)
        }
        .eraseToAnyPublisher()
    }
}

struct NoneDateSchedule: Codable, Identifiable {
    let id = UUID()
        let div, content, startDate, endDate: String
        let allDay: Int

        enum CodingKeys: String, CodingKey {
            case id, div, content
            case startDate = "start_date"
            case endDate = "end_date"
            case allDay = "all_day"
        }
    
    func getStartDate() -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        
        
        return formatter.date(from: self.startDate) ?? NSDate.now as Date
    }
    
    func getEndDate() -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        
        
        return formatter.date(from: self.endDate) ?? NSDate.now as Date
    }
}
