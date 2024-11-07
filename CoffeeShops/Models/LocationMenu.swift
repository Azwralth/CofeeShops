//
//  LocationMenu.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 01.11.2024.
//

import Foundation

struct LocationMenu: Decodable, Hashable {
    let id: Int
    let name: String
    let imageURL: String
    let price: Int
}
