//
//  OrderItem.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 06.11.2024.
//

import Foundation

struct OrderItem: Identifiable, Hashable, Codable {
    var id = UUID()
    let name: String
    let price: Int
    var count: Int
}
