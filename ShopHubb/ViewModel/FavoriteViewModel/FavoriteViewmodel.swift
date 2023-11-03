
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
