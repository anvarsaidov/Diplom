//
//  Main.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

class MainVC: UIViewController {
    
    lazy var searchBar = UISearchBar()
    lazy var tableView = UITableView()
    let indentifireCell = "TableCell"
    
    lazy var api = ApiService()
    var products = Product()
    
    lazy var categories = Categories()
    lazy var arrImage: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Main", comment: "")
        self.view.backgroundColor = .white

        setup()
    }
    
}


