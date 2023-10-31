//
//  FavoriteViewmodel.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 31/10/2023.
//

import Foundation

class FavoriteViewmodel: ObservableObject {
    @Published var products: [Products]
    @Published var favoriteProducts: Set<Int> = []
    init(products: [Products]) {
        self.products = products
    }
    
    func toggleFavorite(_ productID: Int) {
        if favoriteProducts.contains(productID) {
            favoriteProducts.remove(productID)
        } else {
            favoriteProducts.insert(productID)
        }
    }
    func isFavorite(_ productID: Int) -> Bool {
        return favoriteProducts.contains(productID)
    }
}
