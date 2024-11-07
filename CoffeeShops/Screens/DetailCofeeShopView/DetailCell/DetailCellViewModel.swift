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
}
