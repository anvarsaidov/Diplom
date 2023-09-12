//
//  ProductInfo.swift
//  ShopApp
//
//  Created by AnvarSaidov on 28.08.23.
//

import UIKit

class ProductInfoVC: UIViewController {
    
    lazy var viewContainer = UIView()
    lazy var closeButton = UIButton()
    lazy var titleProductLabel = UILabel()
    lazy var imageProduct = UIImageView()
    lazy var descriptioProduct = UILabel()
    lazy var priceProduct = UILabel()
    lazy var raitingProduct = UILabel()
    lazy var addCartProduct = UIButton()
    lazy var countQauntityLabel = UILabel()
    lazy var addQauntityButton = UIButton()
    lazy var minusQauntityButton = UIButton()
    
    var productItem: Product = []
    var userViewModel = UserViewModel()
    var productViewModel = ProductViewModel()
    var cartViewModel = CartProductViewModel()
    var vcDismis: UIViewController?
    var count = 1
    
    let textSize: CGFloat = 18  // размер текста
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartViewModel = DataSharing.shared.cartVM
        userViewModel = DataSharing.shared.userVM
        productViewModel = DataSharing.shared.productVM
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DataSharing.shared.cartVM = cartViewModel
        DataSharing.shared.userVM = userViewModel
        DataSharing.shared.productVM = productViewModel
    }
    
    deinit {
        productItem.removeAll()
    }
    
    func updateBadge(count: Int) {
        let item = tabBarController?.tabBar.items?[1]
        item?.badgeValue = count > 0 ? "\(count)" : nil
    }
}
