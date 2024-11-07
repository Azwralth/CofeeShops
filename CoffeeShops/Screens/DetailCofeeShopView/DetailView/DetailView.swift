//
//  DetailView.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 31.10.2024.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(spacing: -5), count: 2), spacing: 13) {
                            ForEach(viewModel.locationMenu, id: \.self) { item in
                                LazyView(build: DetailViewCell(viewModel: DetailCellViewModel(counter: 0, name: item.name, price: item.price, width: geometry.size.width / 2.4, rectangleHeight: 220, imageHeight: 157, imageUrl: item.imageURL, api: NetworkApi())))
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 17)
                        .padding(.bottom, 21)
                    }
                    
                    Spacer()
                    
                    CustomButton(action: {
                        isPresented.toggle()
                    }, text: "Перейти к оплате")
                    .padding(.bottom, 10)
                }
                .navigationTitle("Меню")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.backward")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .foregroundColor(.systemBrown)
                        }
                    }
                }
                .fullScreenCover(isPresented: $isPresented) {
                    OrderView(viewModel: OrderViewModel())
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(id: 1, api: NetworkApi()))
}
