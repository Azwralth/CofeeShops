//
//  DetailViewModel.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 31.10.2024.
//

import UIKit

final class DetailViewModel: ObservableObject {
    @Published var locationMenu: [LocationMenu] = []
    
    let id: Int
    
    private var api: ServerApi
    
    init(id: Int, api: ServerApi) {
        self.id = id
        self.api = api
        
        fetchMenu()
    }
    
    func fetchMenu() {
        api.fetchData([LocationMenu].self, from: ApiEndpoints.locationMenu(id), httpMethod: .get, token: TokenStorage.shared.getToken(for: "authToken") ?? "") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.locationMenu = data
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
