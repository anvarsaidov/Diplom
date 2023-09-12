//
//  AppTheme.swift
//  ShopApp
//
//  Created by AnvarSaidov on 12.09.23.
//

import Foundation

struct AppTheme {
    static var shared = AppTheme()
    
    let defaults = UserDefaults.standard
    
    var theme: Theme {
        get {
            Theme(rawValue: defaults.integer(forKey: "theme")) ?? .device
        }
        
        set {
            defaults.set(newValue.rawValue, forKey: "theme")
        }
        
    }
}
