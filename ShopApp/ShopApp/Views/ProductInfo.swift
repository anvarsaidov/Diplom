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
    
    lazy var productItem: Product = []
    var productObject: ProductViewModel?
    var cartViewModel = CartProductViewModel()
    var vcDismis: UIViewController?
    var count = 1
    
    weak var delegate: DataTransferDelegate?
    
    let textSize: CGFloat = 18  // размер текста
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
//        let notificationCenter = NotificationCenter.default
//        notificationCenter.post(name: NSNotification.Name.cartProductDic, object: self, userInfo: cartViewModel.cartProductDic)
//        print(#function)
        
       delegate?.dataTransfer(data: cartViewModel)
    }
    
    deinit {
        print(#function)
        productItem.removeAll()
    }
    
}

