//
//  MainViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

extension MainVC {
    
    func setup() {
        
        self.title = "Main".localize(tableName: DataSharing.shared.language)
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "backgroundColor")
        
        configureSearchController()
        configureTableView()
        
        getData()
    }
    
    private func getData() {
        api.getRequestProduct(for: .all) { error, responce in
            if !error.isEmpty {
                let alert = UIAlertController(title: "Error".localize(tableName: DataSharing.shared.language),
                                              message: error,
                                              preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok".localize(tableName: DataSharing.shared.language),
                                              style: .cancel))
                
                self.present(alert, animated: true)
            } else {
                self.productViewModel.products = responce
                self.tableView.reloadData()
            }
        }
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search".localize(tableName: DataSharing.shared.language)
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - Обновление количества элементов в корзине
    func updateCartBadgeValue() {
        let countProductCount = cartProductViewModel.cartProductDic.count
        let item = tabBarController?.tabBar.items?[1]
        item?.badgeValue = countProductCount > 0 ?  "\(countProductCount)" : nil
    }
    
    // MARK: - Конфигурация таблицы
    private func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableCell.self, forCellReuseIdentifier: indentifireCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tintColor = .white
        self.view.addSubview(tableView)
        addConstraintsTableView()
    }
    
    // MARK: - Установка констрэйнтов для таблицы
    private func addConstraintsTableView() {
        NSLayoutConstraint.activate([
            //tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: (navigationController?.navigationBar.frame.height ?? 44) + 48),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 1),
            tableView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 1)
        ])
    }
}
