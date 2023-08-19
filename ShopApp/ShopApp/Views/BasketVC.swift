//
//  BasketVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

class BasketVC: UIViewController {
    
    let imageFon = UIImageView(image: UIImage(named: "welcomeImage"))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(imageFon)
        self.title = NSLocalizedString("Basket", comment: "")
        self.view.backgroundColor = .white
        self.tabBarItem = UITabBarItem(title: NSLocalizedString("Basket", comment: ""), image: UIImage(systemName: "cart"), tag: 1)
        
    }

}
