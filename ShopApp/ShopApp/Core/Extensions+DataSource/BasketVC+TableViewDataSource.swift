//
//  BasketVC+TableViewDataSource.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import UIKit.UITableView

extension BasketVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let product = cartProductVM.cartProductDic.map({$0.key})
        print("numberOfRowsInSection: ", product.count)
        return product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CartTableCell else {
            return UITableViewCell()
        }
        let product = cartProductVM.cartProductDic.map({$0.key})
        let countQuantity = cartProductVM.cartProductDic.map({$0.value})
        let totalPriceProduct = product[row].price * Double(countQuantity[row])
        
        cell.titleLabel.text = "\(product[row].title)"
        cell.descriptionLabel.text = "\(product[row].description)"
        
        cell.priceLabel.text = totalPriceProduct.format(f: "2")
        cell.countQuantityLabel.text = "\(countQuantity[row]) шт."
        
        api.getRequestImageProduct(for: product[row].image) { UIImage in
            DispatchQueue.main.async {
                cell.image.image = UIImage
            }
        }
        
        return cell
    }
}
