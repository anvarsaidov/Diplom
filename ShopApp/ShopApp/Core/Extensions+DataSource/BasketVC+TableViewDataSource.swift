//
//  BasketVC+TableViewDataSource.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import UIKit.UITableView

extension BasketVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5//cartProductVM.cartProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CartTableCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = "\(cartProductVM.cartProduct[row].title)"
        cell.descriptionLabel.text = "\(cartProductVM.cartProduct[row].description)"
        cell.priceLabel.text = "0.00 $"
        
        return cell
    }
    
    
}
