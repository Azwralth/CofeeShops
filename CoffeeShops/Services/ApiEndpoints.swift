//
//  ApiEndpoints.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 31.10.2024.
//

import Foundation

struct ApiEndpoints {
    static let baseUrl = "http://147.78.66.203:3210"
    
    static func login() -> String {
        "\(baseUrl)/auth/login"
    }
    
    static func register() -> String {
        "\(baseUrl)/auth/register"
    }
    
    static func locations() -> String {
        "\(baseUrl)/locations"
    }
    
    static func locationMenu(_ id: Int) -> String {
        "\(baseUrl)/location/\(id)/menu"
    }
}
