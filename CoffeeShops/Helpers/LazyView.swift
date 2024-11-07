//
//  LazyView.swift
//  CofeeShops
//
//  Created by Владислав Соколов on 01.11.2024.
//

import SwiftUI

struct LazyView<Content: View>: View {
    private let build: () -> Content
    
    init(build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    public var body: Content {
        build()
    }
}
