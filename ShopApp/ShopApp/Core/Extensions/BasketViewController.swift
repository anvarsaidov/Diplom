//
//  BasketViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

extension BasketVC {
    
    func setup() {
        
        configureTableView()
        configureTotalPrice()
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
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 24),
            tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1),
            tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8)
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
            totalPriceLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1),
            totalPriceLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            totalPriceLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8)
        ])
    }
}
