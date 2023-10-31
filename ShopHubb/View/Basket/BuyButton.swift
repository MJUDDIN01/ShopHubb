//
//  BuyButton.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 31/10/2023.
//

import SwiftUI

struct BuyButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text("+")
                .foregroundColor(.white)
                .padding(8)
                .background(Color.blue)
                .cornerRadius(5)
        }
    }
}
