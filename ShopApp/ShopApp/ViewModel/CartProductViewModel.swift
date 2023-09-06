//
//  CartProductViewModel.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import Foundation

class CartProductViewModel {
    
    var cartProduct: Product = []
    var cartProductDic: [ProductElement: Int] = [:] {
        didSet {
            calculateTotalPrice()
            print("totalPrice: ", totalPrice)
        }
    }
    var totalPrice: Double = 0
    
    func addToCart(addProduct: ProductElement, quantity: Int) {
        print(#function)
        let products = cartProductDic.map({$0.key})
        // if we don't have any product we just create it with our quantity and leave the func
        if products.isEmpty {
            cartProductDic[addProduct] = quantity
            return
        }
        for product in products {
            // if we already have the product we check our product and add the quantity
            if addProduct.id == product.id {
                cartProductDic[product]! += quantity
            } else {
                // if we have products but dont have this one, we create it with the quantity
                if !products.contains(where: { $0.id == addProduct.id }) {
                    cartProductDic[addProduct] = quantity
                    cartProduct.append(addProduct)
                }
            }
        }
    }
    
    func changeQuantity(product: ProductElement,quantity: Int){
        cartProductDic[product] = quantity
    }
    
    func calculateTotalPrice(){
        var totalprice: Double = 0
        for (product,quantity) in cartProductDic {
            totalprice += product.price * Double(quantity)
        }
            
        totalPrice = totalprice
    }
    func removeFromCart(toRemove: ProductElement){
        cartProductDic.removeValue(forKey: toRemove)
    }
    
}
