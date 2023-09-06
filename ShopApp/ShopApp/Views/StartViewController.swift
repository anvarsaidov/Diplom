//
//  StartViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 6.09.23.
//

import UIKit

class StartVC: UITabBarController {
    
    weak var tabDelegate: DataTransferDelegate?
    
    var cartVM: CartProductViewModel?
    var productVM: ProductViewModel?
    var userVM: UserViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
