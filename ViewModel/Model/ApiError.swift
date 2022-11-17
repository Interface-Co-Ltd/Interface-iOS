//
//  ApiError.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/15.
//

import Foundation

enum ApiError: Error {
    case unknown
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}
