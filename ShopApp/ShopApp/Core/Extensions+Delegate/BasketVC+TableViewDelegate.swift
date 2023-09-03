//
//  BasketVC+TableViewDelegate.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import UIKit.UITableView

extension BasketVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
