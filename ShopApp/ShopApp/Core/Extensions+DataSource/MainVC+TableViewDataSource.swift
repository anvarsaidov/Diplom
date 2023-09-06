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
        print(#function, productObject.products.count)
        return productObject.products.count
    }
    
    // MARK: - Наполняем таблицу данными
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        guard let cell = tableView.dequeueReusableCell(withIdentifier: indentifireCell, for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = productObject.products[row].title
        cell.descriptionLabel.text = productObject.products[row].description
        cell.priceLabel.text = productObject.products[row].price.format(f: "2")
        
        DispatchQueue.main.async {
            self.productObject.api.getRequestImageProduct(for: self.productObject.products[row].image) { UIImage in
                cell.image.image = UIImage
            }
        }
        
        return cell
    }
    
}
