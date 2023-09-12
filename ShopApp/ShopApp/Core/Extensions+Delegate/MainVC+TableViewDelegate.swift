//
//  MainVC+TableViewDelegate.swift
//  ShopApp
//
//  Created by AnvarSaidov on 21.08.23.
//

import UIKit

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let presentVC = ProductInfoVC()
        
        var product: Product
        
        product = isFiltering ? filteredProducts : productViewModel.products
        
        presentVC.productItem.append(product[indexPath.row])
        presentVC.cartViewModel = cartProductViewModel
        presentVC.productViewModel = productViewModel
        presentVC.vcDismis = self
        navigationController?.pushViewController(presentVC, animated: true)
    }
}
