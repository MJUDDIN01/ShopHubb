//
//  FavoriteButton.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 31/10/2023.
//

import SwiftUI

struct FavoriteButton: View {
    var isFavorite: Bool
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundColor(isFavorite ? .red : .gray)
                .padding(8)
                .background(Color.white)
                .cornerRadius(5)
        }
    }
}
