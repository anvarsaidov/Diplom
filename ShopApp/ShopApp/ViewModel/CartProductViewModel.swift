//
//  CartProductViewModel.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import Foundation

final class CartProductViewModel {
    
    var cartProduct: Product = []
    var cartProductDic: [ProductElement: Int] = [:] {
        didSet {
            calculateTotalPrice()
        }
    }
    var totalPrice: Double = 0
    
    func addToCart(addProduct: ProductElement, quantity: Int, complition: ((Int) -> Void?)) {
        let products = cartProductDic.map({$0.key})
        if products.isEmpty {
            cartProductDic[addProduct] = quantity
            complition(cartProductDic.count)
            return
        }
        for product in products {
            if addProduct.id == product.id {
                cartProductDic[product]! += quantity
            } else {
                if !products.contains(where: { $0.id == addProduct.id }) {
                    cartProductDic[addProduct] = quantity
                    cartProduct.append(addProduct)
                }
            }
        }
        complition(cartProductDic.count)
    }
    
    func changeQuantity(product: ProductElement,quantity: Int){
        cartProductDic[product] = quantity
    }
    
    func calculateTotalPrice() {
        var totalprice: Double = 0
        for (product,quantity) in cartProductDic {
            totalprice += product.price * Double(quantity)
        }
        totalPrice = totalprice
    }
    
    func removeFromCart(toRemove: ProductElement, complition: ((Int) -> Void?)) {
        cartProductDic.removeValue(forKey: toRemove)
        complition(cartProductDic.count)
    }
}
