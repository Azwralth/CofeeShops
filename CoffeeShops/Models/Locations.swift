//
//  Locations.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 29.10.2024.
//

import Foundation

struct Locations: Decodable, Hashable {
    let id: Int
    let name: String
    let point: Point
}

struct Point: Decodable, Hashable {
    let latitude: String
    let longitude: String
}
