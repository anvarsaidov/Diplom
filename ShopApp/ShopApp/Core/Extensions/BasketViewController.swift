//
//  BasketViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

extension BasketVC {
    
    func setup() {
        self.title = "Cart".localize(tableName: DataSharing.shared.language)
        
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "backgroundColor")
        
        configureTableView()
        configureTotalPrice()
        configureBuyButton()
    }
    
    func updateTotalPriceLabel() {
        totalPriceLabel.text = "\("Total".localize(tableName: DataSharing.shared.language)) \(cartProductVM.totalPrice.format(f: "2"))"
    }
    
    // MARK: - Конфигурация таблицы
    private func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CartTableCell.self, forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tintColor = .white
        self.view.addSubview(tableView)
        addConstraintsTableView()
    }
    
    // MARK: - Установка констрэйнтов для таблицы
    private func addConstraintsTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1),
            tableView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.9)
        ])
    }
    
    private func configureTotalPrice() {
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLabel.textAlignment = .center
        totalPriceLabel.text = "$$$$"
        totalPriceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(totalPriceLabel)
        addConstraintTotalPrice()
    }
    
    private func addConstraintTotalPrice() {
        NSLayoutConstraint.activate([
            totalPriceLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.03),
            totalPriceLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            totalPriceLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8)
        ])
    }
    
    private func configureBuyButton() {
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.setTitle("Buy".localize(tableName: DataSharing.shared.language), for: .normal)
        buyButton.layer.cornerRadius = 10
        buyButton.backgroundColor = .red
        buyButton.setTitleColor(.black, for: .normal)
        buyButton.addTarget(nil, action: #selector(buyButtonOnClick), for: .touchUpInside)
        self.view.addSubview(buyButton)
        addConstraintBuyButton()
    }
    
    private func addConstraintBuyButton() {
        NSLayoutConstraint.activate([
            buyButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.03),
            buyButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            buyButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8),
            buyButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3)
        ])
    }
    
    @objc
    private func buyButtonOnClick(sender: UIButton) {
        let isLoged = userVM.isLogged
        
        if isLoged {
            let product = cartProductVM.cartProductDic
            
            if product.isEmpty {
                let alert = UIAlertController(title: "titleAlertLogIn".localize(tableName: DataSharing.shared.language),
                                              message: "msgIsEmptyProductCart".localize(tableName: DataSharing.shared.language),
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok".localize(tableName: DataSharing.shared.language),
                                              style: .cancel))
                self.present(alert, animated: true)
            } else {
                for obj in product {
                    userVM.addToCart(addProduct: obj.key, quantity: obj.value)
                    cartProductVM.removeFromCart(toRemove: obj.key) { count in
                        tableView.reloadData()
                        updateBadge(count: count)
                        updateTotalPriceLabel()
                    }
                }
            }
        } else {
            setupActionSheetAlert()
        }
    }
    
    private func setupActionSheetAlert() {
        let alert = UIAlertController(title: "titleAlertLogIn".localize(tableName: DataSharing.shared.language),
                                      message: "ActionSheetMsg".localize(tableName: DataSharing.shared.language),
                                      preferredStyle: .actionSheet)
        
        let actionLogIn = UIAlertAction(title: "SignIn".localize(tableName: DataSharing.shared.language),
                                        style: .default) { _ in
            self.showProfile()
        }
        
        let actionRegistration = UIAlertAction(title: "SignUp".localize(tableName: DataSharing.shared.language),
                                               style: .default) { _ in
            self.showProfile()
        }
        
        let actionCancel = UIAlertAction(title: "Cancel".localize(tableName: DataSharing.shared.language),
                                         style: .cancel)
        
        alert.addAction(actionLogIn)
        alert.addAction(actionRegistration)
        alert.addAction(actionCancel)
        self.present(alert, animated: true)
    }
    
    func showProfile() {
        let tabBar = self.tabBarController as? StartVC
        tabBar?.selectedIndex = 2
    }
    
    func updateBadge(count: Int) {
        let item = tabBarController?.tabBar.items?[1]
        item?.badgeValue = count > 0 ? "\(count)" : nil
    }
}
