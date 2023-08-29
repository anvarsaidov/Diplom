//
//  MainViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

extension MainVC {
    
    func setup() {
        //configureSearchBar()
        configureTableView()
        
        getDataTableView()
    }
    
    // MARK: - Конфигурация поисковой строки SearchBar
    private func configureSearchBar() {
        self.view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsSearchBar()
    }
    
    // MARK: - Установка констрэйнтов для поисковой строки SearchBar
    private func addConstraintsSearchBar() {
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            searchBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64)
        ])
    }
    
    // MARK: - Запрос картинок для продуктов
    private func getDataTableView() {
        api.getRequestProducts(for: EndPointRequest.all) { [self] data, responce in
            products = responce
            self.arrImage.removeAll()
            for obj in responce {
                let url = obj.image
                DispatchQueue.global().async {
                    self.api.getRequestImageProduct(for: url) { image in
                        self.arrImage.append(image)
                        self.tableView.reloadData()
                    }
                }
            }
        }
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
            tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1),
            tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.9)
        ])
    }
}
