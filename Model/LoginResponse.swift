//
//  LoginResponse.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/27.
//

import Foundation

struct LoginResponse: Codable {
    let token: String?
    let statusCode: Int?
    let msg: String?
    let data: String?
}
