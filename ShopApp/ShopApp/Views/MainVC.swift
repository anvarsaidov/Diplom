//
//  Main.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

class MainVC: UIViewController, DataTransferDelegate {
    
    lazy var searchBar = UISearchBar()
    lazy var tableView = UITableView()
    let indentifireCell = "TableCell"
    
    let api = ApiService()
    var cartProductViewModel = CartProductViewModel()
    var productObject = ProductViewModel()
    
    lazy var categories = Categories()
    
    override func viewDidLoad() {
        print("MainVC: ", #function)
        super.viewDidLoad()
        self.title = NSLocalizedString("Main", comment: "")
        self.view.backgroundColor = .white
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func dataTransfer(data: CartProductViewModel) {
        cartProductViewModel = data
    }
}
