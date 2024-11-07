//
//  NetworkError.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 31.10.2024.
//

enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
    case requestError(Error)
}
