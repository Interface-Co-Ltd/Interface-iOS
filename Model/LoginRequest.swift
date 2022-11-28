//
//  LoginInformation.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/27.
//

import Foundation

struct LoginRequest: Codable {
    let studentID: String
    let password: String
}
