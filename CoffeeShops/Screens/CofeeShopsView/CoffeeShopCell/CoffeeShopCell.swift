//
//  CoffeeShopCell.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 29.10.2024.
//

import SwiftUI

struct CoffeeShopCell: View {
    @ObservedObject var viewModel: CoffeeShopCellViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 71)
                .foregroundStyle(.buttonText)
                .padding(.leading, 10)
                .padding(.trailing, 16)
                .shadow(radius: 1.5, y: 3)
            
            VStack(spacing: 6) {
                Text(viewModel.cofeeShopName)
                    .foregroundStyle(.systemBrown)
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                
                Text(viewModel.distanceText)
                    .foregroundStyle(.textField)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .font(.system(size: 14))
            }
        }
    }
}

