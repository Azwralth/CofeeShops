//
//  DetailCellViewModel.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 02.11.2024.
//

import CoreLocation

final class DetailCellViewModel: ObservableObject {
    @Published var counter: Int
    @Published var name: String
    @Published var price: Int
    @Published var width: CGFloat
    @Published var rectangleHeight: CGFloat
    @Published var imageHeight: CGFloat
    @Published var imageUrl: String
    @Published var orders: [OrderItem] = []
    
    private let api: ServerApi
    
    init(counter: Int, name: String, price: Int, width: CGFloat, rectangleHeight: CGFloat, imageHeight: CGFloat, imageUrl: String, api: ServerApi) {
        self.counter = counter
        self.name = name
        self.price = price
        self.width = width
        self.rectangleHeight = rectangleHeight
        self.imageHeight = imageHeight
        self.imageUrl = imageUrl
        self.api = api
    }
    
    private func saveOrders() {
        if let encodedData = try? JSONEncoder().encode(orders) {
            UserDefaults.standard.set(encodedData, forKey: "orders")
        }
    }
    
    func addOrder(item: OrderItem) {
        if let index = orders.firstIndex(where: { $0.name == item.name }) {
            orders[index].count = item.count
        } else {
            orders.append(item)
        }
        saveOrders()
    }
    
    func removeOrder(item: OrderItem) {
        if let index = orders.firstIndex(where: { $0.name == item.name }) {
            orders[index].count -= 1
            if orders[index].count == 0 {
                orders.remove(at: index)
            }
            saveOrders()
        }
    }
}
