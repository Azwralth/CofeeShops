//
//  CoffeeShopsView.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 29.10.2024.
//

import SwiftUI

struct CoffeeShopsView: View {
    @ObservedObject var viewModel: CoffeeShopsViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.locations, id: \.self) { item in
                        NavigationLink(
                            destination: DetailView(viewModel: DetailViewModel(id: item.id, api: NetworkApi()))
                        ) {
                            CoffeeShopCell(viewModel: CoffeeShopCellViewModel(
                                cofeeShopName: item.name,
                                locationManager: viewModel.locationManager,
                                latitude: item.point.latitude,
                                longitude: item.point.longitude
                            ))
                        }
                    }
                    Spacer()
                }
                .padding(.top, 15)
            }
            .navigationTitle("Ближайшие кофейни")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        TokenStorage.shared.deleteToken(for: "authToken")
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(.systemBrown)
                    }
                }
            }
            .onAppear {
                viewModel.fetchLocations()
            }
        }
    }
}

#Preview {
    CoffeeShopsView(viewModel: CoffeeShopsViewModel(api: NetworkApi()))
}
