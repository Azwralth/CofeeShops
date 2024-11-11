//
//  RegisterViewModel.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 29.10.2024.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    @Published var loginText = ""
    @Published var passwordText = ""
    
    private var api: AuthApi
    
    init(api: AuthApi) {
        self.api = api
    }
    
    func register() {
        let requestBody = LoginRequest(login: loginText, password: passwordText)
        api.performAuthRequest(LoginResponse.self, from: ApiEndpoints.register(), requestBody: requestBody) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
