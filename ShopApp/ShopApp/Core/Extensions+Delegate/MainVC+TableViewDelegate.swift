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
        presentVC.productItem.append(products[indexPath.row])
        presentVC.image = arrImage[indexPath.row]
        self.present(presentVC, animated: true)
    }
}
