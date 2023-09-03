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
    }
    
    // MARK: - Конфигурация таблицы
    private func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableCell.self, forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tintColor = .white
        self.view.addSubview(tableView)
        addConstraintsTableView()
    }
    
    // MARK: - Установка констрэйнтов для таблицы
    private func addConstraintsTableView() {
        NSLayoutConstraint.activate([
            tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1),
            tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.9)
        ])
    }
}
