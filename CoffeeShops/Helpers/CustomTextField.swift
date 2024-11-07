//
//  CustomTextField.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 29.10.2024.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    var title: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.systemBrown)
                .font(.system(size: 15))
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(.system(size: 18))
                        .foregroundColor(.textField)
                        .padding(.leading, 15)
                }
                
                if isSecure {
                    SecureField("", text: $text)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 23)
                                .stroke(Color.brown, lineWidth: 2)
                        )
                        .foregroundColor(Color.brown)
                } else {
                    TextField("", text: $text)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 23)
                                .stroke(Color.brown, lineWidth: 2)
                        )
                        .foregroundColor(Color.brown)
                }
            }
        }
        .padding(.horizontal)
    }
}
