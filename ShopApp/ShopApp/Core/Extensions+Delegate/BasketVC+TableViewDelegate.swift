//
//  BasketVC+TableViewDelegate.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import UIKit.UITableView

extension BasketVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .destructive, title: "Delete".localize(tableName: DataSharing.shared.language),
                               handler: { [self] _, _, completion in
                let key = Array(self.cartProductVM.cartProductDic.keys)[indexPath.row]
                self.cartProductVM.removeFromCart(toRemove: key) { count in
                    updateBadge(count: count)
                }
                completion(true)
                tableView.reloadData()
                self.updateTotalPriceLabel()
            })
        ])
    }
    
    
}
