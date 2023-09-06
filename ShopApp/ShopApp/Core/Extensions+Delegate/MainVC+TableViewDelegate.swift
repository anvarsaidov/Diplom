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
        presentVC.productItem.append(productObject.products[indexPath.row])
        presentVC.cartViewModel = cartProductViewModel
        presentVC.productObject = productObject
        presentVC.vcDismis = self
        self.present(presentVC, animated: true)
    }
}
