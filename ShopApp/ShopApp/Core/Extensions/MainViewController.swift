//
//  MainViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

extension MainVC {
    
    func setup() {
        configureSearchBar()
        configureTableView()
        
        api.getRequestProduct(for: .all) { data, responce in
            self.productObject.products = responce
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Конфигурация поисковой строки SearchBar
    private func configureSearchBar() {
        self.view.addSubview(searchBar)
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsSearchBar()
    }
    
    // MARK: - Установка констрэйнтов для поисковой строки SearchBar
    private func addConstraintsSearchBar() {
        NSLayoutConstraint.activate([
            searchBar.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1),
            searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            searchBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60)
        ])
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
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1),
            tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
        ])
    }
}
