//
//  BasketVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

class BasketVC: UIViewController {
    
    let cartProductVM = CartProductViewModel()
    
    let identifier = "cartIdentifier"
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Cart", comment: "")
        self.view.backgroundColor = .white
        
        setup()
    }

}
