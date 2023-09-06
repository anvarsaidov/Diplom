//
//  ProductViewModel.swift
//  ShopApp
//
//  Created by AnvarSaidov on 29.08.23.
//

import Foundation

class ProductViewModel {
    var api = ApiService()
    var products: Product = []
    
    func getProduct() {
        api.getRequestProduct(for: .all) { data, responce in
            self.products = responce
        }
    }
}
