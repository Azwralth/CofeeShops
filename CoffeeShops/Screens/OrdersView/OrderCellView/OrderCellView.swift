//
//  OrderCellView.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 05.11.2024.
//

import SwiftUI

struct OrderCellView: View {
    @ObservedObject var viewModel: OrderCellViewModel
    
    var body: some View {
        if viewModel.count > 0 {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 71)
                    .foregroundStyle(.buttonText)
                    .padding(.leading, 10)
                    .padding(.trailing, 16)
                    .shadow(radius: 1.5, y: 3)
                
                HStack {
                    VStack(spacing: 6) {
                        Text(viewModel.name)
                            .foregroundStyle(.systemBrown)
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                        
                        Text("\(viewModel.price) руб")
                            .foregroundStyle(.textField)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                            .font(.system(size: 14))
                    }
                    
                    Button {
                        if viewModel.count > 0 {
                            viewModel.count -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .foregroundStyle(.systemBrown)
                    }
                    
                    Text("\(viewModel.count)")
                        .foregroundStyle(.systemBrown)
                        .padding(.horizontal, 9)
                    
                    Button {
                        viewModel.count += 1
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.systemBrown)
                    }
                }
                .padding(.trailing, 26)
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    OrderCellView(viewModel: OrderCellViewModel(name: "Капучино", price: 200, count: 2))
}
