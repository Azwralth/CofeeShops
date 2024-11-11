//
//  LoginViewModel.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 29.10.2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var loginText = ""
    @Published var passwordText = ""
    
    
    private var api: AuthApi
    
    init(api: AuthApi) {
        self.api = api
    }
    
    func login() {
        let requestBody = LoginRequest(login: loginText, password: passwordText)
        api.performAuthRequest(LoginResponse.self, from: ApiEndpoints.login(), requestBody: requestBody) { result in
            switch result {
            case .success(let data):
                TokenStorage.shared.saveToken(data.token, for: "authToken")
            case .failure(let error):
                print(error)
            }
        }
    }
}
