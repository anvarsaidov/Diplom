//
//  HistoryViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 13.09.23.
//

import UIKit

extension HistoryVC {
    
    func setupVC() {
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        configureTableVIew()
        configureTotalPriceLabel()
    }
    
    private func configureTableVIew() {
        self.view.addSubview(tableView)
        tableView.register(CartTableCell.self, forCellReuseIdentifier: identifire)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tintColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addConstraintTableView()
    }
    
    private func addConstraintTableView() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.9),
            tableView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func configureTotalPriceLabel() {
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLabel.text = "Total: $$$$"
        self.view.addSubview(totalPriceLabel)
        addConstraintTotalPriceLabel()
    }
    
    private func addConstraintTotalPriceLabel() {
        NSLayoutConstraint.activate([
            totalPriceLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            totalPriceLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8)
        ])
    }
    
    func updateTotalPrice() {
        var totalPrice: Double = 0
        for (product,quantity) in userVM.users[userVM.idUser].cartProductHistory {
            totalPrice += product.price * Double(quantity)
        }
        totalPriceLabel.text = "\("Total".localize(tableName: DataSharing.shared.language)) \(totalPrice.format(f: "2"))"
    }
}
