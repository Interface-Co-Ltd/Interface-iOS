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
                return URL(string: "https://637b8bb210a6f23f7fac1c5b.mockapi.io/schedule")!
            case .fetchUser:
                return URL(string: "")!
            case .fetchCooperations:
                return URL(string: "")!
            case .fetchLogin:
                return URL(string: "")!
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
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
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
        .decode(type: [Board].self, decoder: decoder)
        .mapError {error in
            ApiError.convert(error: error)
        }
        .eraseToAnyPublisher()
    }
    
    static func fetchSchedules(token: String) -> AnyPublisher<[Schedule], ApiError> {
        var request = URLRequest(url: API.fetchUser.url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
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
        .decode(type: [Schedule].self, decoder: decoder)
        .mapError { error in
            ApiError.convert(error: error)
        }
        .eraseToAnyPublisher()
    }
    
    static func fetchUser(token: String) -> AnyPublisher<User, ApiError> {
        var request = URLRequest(url: API.fetchUser.url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
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
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
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
        .decode(type: [Cooperation].self, decoder: JSONDecoder())
        .mapError { error in
            ApiError.convert(error: error)
        }
        .eraseToAnyPublisher()
    }
    
    static func fetchLogin(studentID: String, password: String) -> AnyPublisher<LoginResponse, AuthenticationErorr> {
        let body = LoginRequest(studentID: studentID, password: password)
        
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
            
            return $0.data
        }
        .decode(type: LoginResponse.self, decoder: JSONDecoder())
        .mapError { error in
            AuthenticationErorr.convert(error: error)
        }
        .eraseToAnyPublisher()
    }
    
//    static func login(studentID: String, password: String, completion: @escaping (Result<String, AuthenticationErorr>) -> Void) {
//        let body = LoginRequest(studentID: studentID, password: password)
//
//        var request = URLRequest(url: API.fetchLogin.url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = try? JSONEncoder().encode(body)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                completion(.failure(.custom(errorMessage: "No data")))
//                return
//            }
//
//            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
//                completion(.failure(.invalidCredentials))
//                return
//            }
//
//            guard let token = loginResponse.token else {
//                completion(.failure(.invalidCredentials))
//
//                return
//            }
//
//            completion(.success(token))
//        }.resume()
//    }
}
