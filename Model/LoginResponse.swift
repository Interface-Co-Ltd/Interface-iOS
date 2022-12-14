//
//  LoginResponse.swift
//  InterfaceCoLtd
//
//  Created by κΉλν on 2022/11/27.
//

import Foundation

struct LoginResponse: Codable {
    let token: String?
    let statusCode: Int?
    let msg: String?
    let data: String?
}
