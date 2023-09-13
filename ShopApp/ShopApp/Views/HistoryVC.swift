//
//  HistoryVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 11.09.23.
//

import UIKit

class HistoryVC: UIViewController {
    
    let identifire = "historyCell"
    let api = ApiService()
    
    lazy var tableView = UITableView()
    lazy var totalPriceLabel = UILabel()
    
    var userVM = UserViewModel() {
        didSet {
            tableView.reloadData()
            updateTotalPrice()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        self.title = "HistoryButton".localize(tableName: DataSharing.shared.language)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userVM = DataSharing.shared.userVM
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DataSharing.shared.userVM = userVM
    }
}
