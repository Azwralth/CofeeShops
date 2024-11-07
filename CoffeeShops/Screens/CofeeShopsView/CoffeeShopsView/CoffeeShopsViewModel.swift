//
//  CoffeeShopsViewModel.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 29.10.2024.
//

import SwiftUI

final class CoffeeShopsViewModel: ObservableObject {
    @Published var locations: [Locations] = []
    let locationManager = LocationManager()
    
    private let api: ServerApi
    
    init(api: ServerApi) {
        self.api = api
    }
    
    func fetchLocations() {
        api.fetchData([Locations].self, from: ApiEndpoints.locations(), httpMethod: .get, token: TokenStorage.shared.getToken(for: "authToken") ?? "") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.locations = data
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}