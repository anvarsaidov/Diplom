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
        products.count
    }
    
    // MARK: - Наполняем таблицу данными
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        guard let cell = tableView.dequeueReusableCell(withIdentifier: indentifireCell, for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        let image = !arrImage.isEmpty ? arrImage[row] : UIImage(systemName: "network")
        cell.image.image = image
        cell.titleLabel.text = products[row].title
        cell.descriptionLabel.text = products[row].description
        cell.priceLabel.text = products[row].price.format(f: "2") //"\(String(format: "%.2f", products[row].price)) $"
        
        return cell
    }
    
}

