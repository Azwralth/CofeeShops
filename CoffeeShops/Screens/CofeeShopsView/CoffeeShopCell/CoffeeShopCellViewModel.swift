//
//  CoffeeShopCellViewModel.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 05.11.2024.
//

import SwiftUI
import CoreLocation
import Combine

final class CoffeeShopCellViewModel: ObservableObject {
    @Published var cofeeShopName: String
    @Published var latitude: String
    @Published var longitude: String
    @Published var distanceText = "Загрузка..."

    private let locationManager: LocationManager
    private var cancellable: AnyCancellable?

    init(cofeeShopName: String, locationManager: LocationManager, latitude: String, longitude: String) {
        self.cofeeShopName = cofeeShopName
        self.latitude = latitude
        self.longitude = longitude
        self.locationManager = locationManager
        
        cancellable = locationManager.$userLocation.sink { [weak self] _ in
            self?.updateDistanceText()
        }
        
        updateDistanceText()
    }

    private func updateDistanceText() {
        guard let lat = Double(latitude), let long = Double(longitude),
              let userLocation = locationManager.userLocation else {
            distanceText = "Не удалось определить расстояние"
            return
        }

        let destinationLocation = CLLocation(latitude: lat, longitude: long)
        let distance = userLocation.distance(from: destinationLocation) / 1000
        distanceText = String(format: "в %.1f км от вас", distance)
    }
}

