//
//  TokenStorage.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 28.10.2024.
//

import Foundation

final class TokenStorage {
    static let shared = TokenStorage()
    
    private let userDefaults = UserDefaults.standard

    private init() {}
    
    func saveToken(_ token: String, for key: String) {
        userDefaults.setValue(token, forKey: key)
    }
    
    func getToken(for key: String) -> String? {
        userDefaults.string(forKey: key)
    }
    
    func deleteToken(for key: String) {
        userDefaults.removeObject(forKey: key)
    }
}

