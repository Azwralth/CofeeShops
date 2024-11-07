//
//  DetailViewCell.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 31.10.2024.
//

import SwiftUI

struct DetailViewCell: View {
    @ObservedObject var viewModel: DetailCellViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(width: viewModel.width, height: viewModel.rectangleHeight)
            .padding(.horizontal, 13)
            .foregroundStyle(.white)
            .shadow(radius: 1, y: 2)
            .overlay {
                VStack(spacing: 10) {
                    VStack(spacing: 10) {
                        if !viewModel.imageUrl.isEmpty {
                            AsyncImage(url: URL(string: viewModel.imageUrl)) { image in
                                image
                                    .resizable()
                                    .clipShape(.rect(topLeadingRadius: 5,  topTrailingRadius: 5))
                                    .frame(width: viewModel.width, height: viewModel.imageHeight)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: viewModel.width, height: viewModel.imageHeight)
                            }
                        } else {
                            ProgressView()
                                .frame(width: viewModel.width, height: viewModel.imageHeight)
                        }
                        
                        HStack {
                            Text(viewModel.name)
                                .foregroundStyle(.textField)
                                .font(.system(size: 15))
                                .padding(.leading, 11)
                            
                            Spacer()
                        }
                        .padding(.leading, 10)
                    }
                    
                    
                    HStack {
                        Text("\(viewModel.price) руб")
                            .foregroundStyle(.systemBrown)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .padding(.leading, 21)
                        
                        Spacer()
                        
                        Button {
                            if viewModel.counter > 0 {
                                viewModel.counter -= 1
                            }
                        } label: {
                            Image(systemName: "minus")
                                .foregroundStyle(.buttonText)
                        }
                        
                        Text("\(viewModel.counter)")
                            .foregroundStyle(.systemBrown)
                        
                        Button {
                            viewModel.counter += 1
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.buttonText)
                        }
                        .padding(.trailing, 16)
                    }
                    .padding(.bottom, 5)
                }
            }
    }
}

#Preview {
    DetailViewCell(viewModel: DetailCellViewModel(counter: 1, name: "Эспрессо", price: 123, width: 169, rectangleHeight: 204, imageHeight: 137, imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Espresso_and_napolitains.jpg/1200px-Espresso_and_napolitains.jpg", api: NetworkApi()))
}
