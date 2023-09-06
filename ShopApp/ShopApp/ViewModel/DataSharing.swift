//
//  DataSharing.swift
//  ShopApp
//
//  Created by AnvarSaidov on 6.09.23.
//

import Foundation

final class DataSharing {
    static var shared = DataSharing()
    
    var productVM = ProductViewModel()
    var cartVM = CartProductViewModel()
    var userVM = UserViewModel()
    
    private init() {}
}
