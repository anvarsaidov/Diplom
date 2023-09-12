//
//  Main.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

class MainVC: UIViewController {
    
    lazy var searchController = UISearchController(searchResultsController: nil)
    lazy var tableView = UITableView()
    let indentifireCell = "TableCell"
    
    let api = ApiService()
    
    var cartProductViewModel = CartProductViewModel() {
        didSet {
            updateCartBadgeValue()
        }
    }
    
    var productViewModel = ProductViewModel()
    var filteredProducts: Product = []
    var userViewModel = UserViewModel()
    
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false}
        return !text.isEmpty
    }
    
    var isFiltering: Bool {
        return searchBarIsEmpty && searchController.isActive
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        print(#function, userViewModel.isLogged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartProductViewModel = DataSharing.shared.cartVM
        productViewModel = DataSharing.shared.productVM
        userViewModel = DataSharing.shared.userVM
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DataSharing.shared.cartVM = cartProductViewModel
        DataSharing.shared.productVM = productViewModel
        DataSharing.shared.userVM = userViewModel
    }
}
