//
//  MainVC+TableViewDataSource.swift
//  ShopApp
//
//  Created by AnvarSaidov on 21.08.23.
//

import UIKit

extension MainVC: UITableViewDataSource {
    
    // MARK: - Задаем количество строк
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrImage.count
    }
    
    // MARK: - Наполняем таблицу данными
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        guard let cell = tableView.dequeueReusableCell(withIdentifier: indentifireCell, for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        
        cell.image.image = arrImage[row]
        cell.titleLabel.text = products[row].title
        cell.descriptionLabel.text = products[row].description
        cell.priceLabel.text = "\(String(format: "%.2f", products[row].price)) $"
        
        return cell
    }
    
}

