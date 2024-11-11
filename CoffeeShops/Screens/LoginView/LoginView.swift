//
//  LoginView.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 28.10.2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                VStack(spacing: 24) {
                    CustomTextField(placeholder: "example@example.ru", title: "e-mail", text: $viewModel.loginText)
                    
                    CustomTextField(placeholder: "******", title: "Пароль", text: $viewModel.passwordText, isSecure: true)
                }
                
                CustomButton(
                    action: {
                        isPresented.toggle()
                        viewModel.login()
                    },
                    text: "войти")
            }
            .navigationTitle("Вход")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $isPresented) {
                LazyView(build: CoffeeShopsView(viewModel: CoffeeShopsViewModel(api: NetworkApi())))
            }
        }
    }
}


#Preview {
    LoginView(viewModel: LoginViewModel(api: AuthService()))
}
