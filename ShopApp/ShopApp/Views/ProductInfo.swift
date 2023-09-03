//
//  ProductInfo.swift
//  ShopApp
//
//  Created by AnvarSaidov on 28.08.23.
//

import UIKit

class ProductInfoVC: UIViewController {
    
    let viewContainer = UIView()
    let closeButton = UIButton()
    let titleProductLabel = UILabel()
    let imageProduct = UIImageView()
    let descriptioProduct = UILabel()
    let priceProduct = UILabel()
    let raitingProduct = UILabel()
    let addCartProduct = UIButton()
    let countQauntityLabel = UILabel()
    
    lazy var productItem: Product = []
    lazy var image = UIImage()
    
    let textSize: CGFloat = 18  // размер текста
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    deinit {
        productItem.removeAll()
    }
}
