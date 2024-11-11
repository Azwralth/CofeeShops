//
//  OrderView.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 05.11.2024.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var viewModel: OrderViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.orders, id: \.self) { item in
                        OrderCellView(viewModel: OrderCellViewModel(name: item.name, price: item.price, count: item.count))
                    }
                }
                .padding(.top, 15)
            }
            .navigationTitle("Ваш заказ")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(.systemBrown)
                    }
                }
            }
        }
    }
}


#Preview {
    OrderView(viewModel: OrderViewModel())
}
