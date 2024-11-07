//
//  LoginResponse.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 31.10.2024.
//

import Foundation

struct LoginRequest: Codable {
    let login: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String
    let tokenLifetime: Int
}
