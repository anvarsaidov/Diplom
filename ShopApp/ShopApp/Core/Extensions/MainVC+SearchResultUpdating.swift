//
//  MainVC+SearchResultUpdating.swift
//  ShopApp
//
//  Created by AnvarSaidov on 7.09.23.
//

import UIKit.UISearchController

extension MainVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filtercontentForSearchText(text)
    }
    
    private func filtercontentForSearchText(_ searchText: String) {
        filteredProducts = productViewModel.products.filter({ ProductElement in
            return ProductElement.title.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
