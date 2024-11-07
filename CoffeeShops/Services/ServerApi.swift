//
//  ServerApi.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 29.10.2024.
//

import UIKit

protocol ServerApi {
    func fetchData<T: Decodable>(_ type: T.Type, from url: String, httpMethod: HttpMethods, token: String, completion: @escaping (Result<T, NetworkError>) -> Void)
    
    func fetchImage(from url: String, completion: @escaping (Result<UIImage, NetworkError>) -> Void)
}

final class NetworkApi: ServerApi {
    func fetchData<T: Decodable>(_ type: T.Type, from url: String, httpMethod: HttpMethods, token: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.description
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJBdXRoZW50aWNhdGlvbiIsImlzcyI6ImNvZmZlZSBiYWNrZW5kIiwiaWQiOjE0NTcsImV4cCI6MTczMDk3MzQyMX0.GHfo1aL700Cq2mshQHaCLm0O4KTbBF0qtQ_RDv8ozK4", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error {
                completion(.failure(.requestError(error)))
            }
            
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON Response: \(jsonString)")
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchImage(from url: String, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                completion(.failure(.requestError(error)))
                return
            }
            
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            if let image = UIImage(data: data) {
                completion(.success(image))
            } else {
                completion(.failure(.decodingError))
            }
        }
    }
}
