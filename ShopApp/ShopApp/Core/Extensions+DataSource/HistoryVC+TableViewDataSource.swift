//
//  HistoryVC+TableViewDataSource.swift
//  ShopApp
//
//  Created by AnvarSaidov on 13.09.23.
//

import UIKit.UITableView

extension HistoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let idUser = userVM.idUser
        return userVM.users[idUser].cartProductHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let productHistory = userVM.users[userVM.idUser].cartProductHistory
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as? CartTableCell else {
            return UITableViewCell()
        }
        
        let product = productHistory.map({$0.key})
        let countQuantity = productHistory.map({$0.value})
        let totalPriceProduct = product[row].price * Double(countQuantity[row])
        
        cell.titleLabel.text = "\(product[row].title)"
        cell.descriptionLabel.text = "\(product[row].description)"
        
        cell.priceLabel.text = totalPriceProduct.format(f: "2")
        cell.countQuantityLabel.text = "\(countQuantity[row])" + "pcs".localize(tableName: DataSharing.shared.language)
    
        api.getRequestImageProduct(for: product[row].image) { UIImage in
            DispatchQueue.main.async {
                cell.image.image = UIImage
            }
        }
        return cell
    }
}
