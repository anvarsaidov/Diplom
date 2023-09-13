//
//  HistoryVC+TableViewDelegate.swift
//  ShopApp
//
//  Created by AnvarSaidov on 13.09.23.
//

import UIKit.UITableView

extension HistoryVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
