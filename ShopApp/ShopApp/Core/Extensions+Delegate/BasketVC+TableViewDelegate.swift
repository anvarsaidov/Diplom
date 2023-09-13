//
//  BasketVC+TableViewDelegate.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import UIKit.UITableView

extension BasketVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let keys = Array(cartProductVM.cartProductDic.keys)[indexPath.row]
        guard let productItem = cartProductVM.cartProductDic[keys] else { return }
        
        let alert = UIAlertController(title: "EditQuantity".localize(tableName: DataSharing.shared.language),
                                      message: "",
                                      preferredStyle: .alert)
        alert.addTextField { UITextField in
            UITextField.placeholder = "Quantity".localize(tableName: DataSharing.shared.language)
            UITextField.text = "\(String(describing: productItem))"
            UITextField.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Accept".localize(tableName: DataSharing.shared.language),
                                      style: UIAlertAction.Style.default,
                                      handler: { UIAlertAction in
            guard let countText = alert.textFields?[0].text else { return }
            if let count = Int(countText), count > 0 {
                self.cartProductVM.cartProductDic[keys] = Int(count)
            } else {
                self.cartProductVM.cartProductDic[keys] = 1
            }
            self.updateTotalPriceLabel()
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel".localize(tableName: DataSharing.shared.language),
                                      style: .cancel))
        self.present(alert, animated: true)
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
