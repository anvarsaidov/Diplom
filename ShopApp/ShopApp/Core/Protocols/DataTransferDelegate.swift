//
//  DataTransferDelegate.swift
//  ShopApp
//
//  Created by AnvarSaidov on 6.09.23.
//

import Foundation

protocol DataTransferDelegate: AnyObject {
    func dataTransfer(data: CartProductViewModel)
}
