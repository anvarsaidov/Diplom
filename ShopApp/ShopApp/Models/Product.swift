import Foundation

// MARK: - ProductElement
struct ProductElement: Decodable, Hashable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let image: String
    let rating: Rating
}

enum Category: String, Decodable, Hashable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Decodable, Hashable {
    let rate: Double
    let count: Int
}

typealias Product = [ProductElement]
