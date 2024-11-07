//
//  HttpMethods.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 31.10.2024.
//

enum HttpMethods {
    case get
    case post
    case put
    case delete
    case head
    case options
    
    var description: String {
        switch self {
        case .get:
            "GET"
        case .post:
            "POST"
        case .put:
            "PUT"
        case .delete:
            "DELETE"
        case .head:
            "HEAD"
        case .options:
            "OPTIONS"
        }
    }
}
