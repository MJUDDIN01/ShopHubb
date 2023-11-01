
import Foundation

struct ProductResponse: Codable {
    let products: [Products]
    let total: Int
}

struct Products: Identifiable, Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    var thumbNailUrl: URL? {
        return URL(string: thumbnail)
    }
    var imagesUrl: [URL] {
        return images.compactMap { URL(string: $0) }
    }
}
