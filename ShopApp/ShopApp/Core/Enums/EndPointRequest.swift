//
//  EndPointRequest.swift
//  ShopApp
//
//  Created by AnvarSaidov on 29.08.23.
//

import Foundation

enum EndPointRequest: String, CaseIterable {
    
    case all = "All"
    case jewelery = "Jewelery"
    case electronics = "Electronics"
    case men = "Men's clothing"
    case women = "Women's clothing"
    case user = "users"
    
    var description: String {
        switch self {
        case .all:
            return "products/"
            
        case .jewelery:
            return "products/category/jewelery"
            
        case .electronics:
            return "products/category/electronics"
            
        case .men:
            return "products/category/men's%20clothing"
            
        case .women:
            return "products/category/women's%20clothing"
            
        case .user:
            return "users/"
        }
    }
}
