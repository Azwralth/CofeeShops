//
//  AuthService.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 28.10.2024.
//

import Foundation

protocol AuthApi {
    func performAuthRequest<T: Codable, U: Codable>(_ type: T.Type, from url: String, requestBody: U, completion: @escaping (Result<T, NetworkError>) -> Void)
}

final class AuthService: AuthApi {
    func performAuthRequest<T: Codable, U: Codable>(_ type: T.Type, from url: String, requestBody: U, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethods.post.description
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(requestBody)
        
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error {
                completion(.failure(.requestError(error)))
                return
            }
            
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
                
            } catch {
                completion(.failure(.requestError(error)))
            }
        }.resume()
    }
}
