//
//  DataSharing.swift
//  ShopApp
//
//  Created by AnvarSaidov on 6.09.23.
//

import UIKit

final class DataSharing {
    static var shared = DataSharing()
    let defaults = UserDefaults.standard
    var productVM = ProductViewModel()
    var cartVM = CartProductViewModel()
    var userVM = UserViewModel()
    var language: String = "" {
        didSet {
            defaults.set(self.language, forKey: "lang")
        }
    }
    
    private init() {}
}
