//
//  CoffeeShopsApp.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 28.10.2024.
//

import SwiftUI

@main
struct CoffeeShopsApp: App {
    
    init() {
        setupNavigationAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            RegisterView(viewModel: RegisterViewModel(api: AuthService()))
                .environmentObject(OrderViewModel())
        }
    }
    
    private func setupNavigationAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor(.systemBrown), .font: UIFont.systemFont(ofSize: 18, weight: .bold)]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(.systemBrown), .font: UIFont.systemFont(ofSize: 18, weight: .bold)]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
