//
//  RegisterView.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 29.10.2024.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel: RegisterViewModel
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                VStack(spacing: 24) {
                    CustomTextField(placeholder: "example@example.ru", title: "e-mail", text: $viewModel.loginText)
                    
                    CustomTextField(placeholder: "******", title: "Пароль", text: $viewModel.passwordText, isSecure: true)
                    
                    CustomTextField(placeholder: "******", title: "Повторите пароль", text: $viewModel.passwordText, isSecure: true)
                }
                
                CustomButton(
                    action: {
                        isPresented.toggle()
                    },
                    text: "Регистрация")
            }
            .navigationTitle("Регистрация")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $isPresented) {
                LoginView(viewModel: LoginViewModel(api: AuthService()))
            }
        }
        
    }
}

#Preview {
    RegisterView(viewModel: RegisterViewModel(api: AuthService()))
}
