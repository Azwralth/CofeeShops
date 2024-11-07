//
//  CustomButton.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 29.10.2024.
//

import SwiftUI

struct CustomButton: View {
    var action: () -> Void
    var text: String
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 23)
                    .padding(.horizontal, 18)
                    .frame(height: 48)
                    .foregroundStyle(.button)
                Text(text)
                    .foregroundStyle(.buttonText)
                    .fontWeight(.bold)
                    .font(.system(size: 18))
            }
        }
    }
}
