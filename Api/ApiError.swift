//
//  ApiError.swift
//  InterfaceCoLtd
//
//  Created by κΉλν on 2022/11/15.
//

import Foundation

enum ApiError: Error, CustomStringConvertible {
    case unknown(Error)
    case invalidUrl(URLError?)
    case invalidResponse
    case failed(Int)
    case emptyData
    
    static func convert(error: Error) -> ApiError {
        switch error {
            case is URLError:
                return .invalidUrl(error as? URLError)
            case is ApiError:
                return error as! ApiError
            default:
                return .unknown(error)
        }
    }
    
    var description: String {
        return ""
    }
}
