//
//  BasketVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

class BasketVC: UIViewController {
   
    let identifier = "myCell"
    lazy var tableView = UITableView()
    lazy var totalPriceLabel = UILabel()
    lazy var buyButton = UIButton()
    var cartProductVM = CartProductViewModel() {
        didSet {
            updateTotalPriceLabel()
            tableView.reloadData()
            updateBadge(count: cartProductVM.cartProductDic.count)
        }
    }
    
    var userVM = UserViewModel()
    
    let api = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartProductVM = DataSharing.shared.cartVM
        userVM = DataSharing.shared.userVM
        
        tableView.reloadData()
        updateTotalPriceLabel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        DataSharing.shared.cartVM = cartProductVM
        DataSharing.shared.userVM = userVM
    }
    
    deinit {
    }
}
