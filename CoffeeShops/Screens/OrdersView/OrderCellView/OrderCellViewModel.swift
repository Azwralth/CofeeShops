//
//  OrderCellViewModel.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 05.11.2024.
//

import Foundation

final class OrderCellViewModel: ObservableObject {
    @Published var name: String
    @Published var price: Int
    @Published var count: Int
    
    init(name: String, price: Int, count: Int) {
        self.name = name
        self.price = price
        self.count = count
    }
}
