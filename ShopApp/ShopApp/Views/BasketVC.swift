//
//  BasketVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

class BasketVC: UIViewController, DataTransferDelegate {
   
    
    let identifier = "myCell"
    lazy var tableView = UITableView()
    lazy var totalPriceLabel = UILabel()
    lazy var cartProductVM = CartProductViewModel()
    
//    let notificationCenter = NotificationCenter.default
    let api = ApiService()
    
    
    override func viewDidLoad() {
        print("BasketVC: ",#function)
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Cart", comment: "")
        self.view.backgroundColor = .white
        
        setup()
//
//        notificationCenter.addObserver(self, selector: #selector(notificationObserver(notification:)), name: NSNotification.Name.cartProductDic, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(cartProductVM.cartProductDic.count)
        tableView.reloadData()
        totalPriceLabel.text = "Total: \(cartProductVM.totalPrice.format(f: "2"))"
    }
    
    func dataTransfer(data: CartProductViewModel) {
        print(#function)
        cartProductVM = data
    }
    
    deinit {
//        notificationCenter.removeObserver(self)
    }
//
//    @objc
//    private func notificationObserver(notification: Notification) {
//        guard let data = notification.userInfo as? [ProductElement: Int] else { return }
//        cartProductVM.cartProductDic = data
//        tableView.reloadData()
//    }

}
