//
//  LoginInformation.swift
//  InterfaceCoLtd
//
//  Created by κΉλν on 2022/11/27.
//

import Foundation

struct LoginRequest: Codable {
    let studentId: String
    let password: String
    let fcmToken: String
}
