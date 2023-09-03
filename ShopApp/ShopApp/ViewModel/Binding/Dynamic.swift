//
//  Dynamic.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import Foundation
class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(_ listener: @escaping Listener) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
