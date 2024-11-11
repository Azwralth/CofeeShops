//
//  OrderViewModel.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 05.11.2024.
//

import Foundation

final class OrderViewModel: ObservableObject {
    @Published var orders: [OrderItem] = []
    
    init() {
        loadOrders()
    }
    
    
    private func loadOrders() {
            if let savedData = UserDefaults.standard.data(forKey: "orders"),
               let decodedOrders = try? JSONDecoder().decode([OrderItem].self, from: savedData) {
                self.orders = decodedOrders
            }
        }
}

