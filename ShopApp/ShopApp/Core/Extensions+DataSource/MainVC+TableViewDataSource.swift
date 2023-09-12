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
        if isFiltering {
            return filteredProducts.count
        }
        return productViewModel.products.count
    }
    
    // MARK: - Наполняем таблицу данными
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        guard let cell = tableView.dequeueReusableCell(withIdentifier: indentifireCell, for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        
        var product: Product
        
        if isFiltering {
            product = filteredProducts
        } else {
            product = productViewModel.products
        }
        
        cell.titleLabel.text = product[row].title
        cell.descriptionLabel.text = product[row].description
        cell.priceLabel.text = product[row].price.format(f: "2")
        
        DispatchQueue.main.async {
            self.productViewModel.api.getRequestImageProduct(for: product[row].image) { UIImage in
                cell.image.image = UIImage
            }
        }
        return cell
    }
}
