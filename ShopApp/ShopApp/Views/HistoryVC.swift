//
//  HistoryVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 11.09.23.
//

import UIKit

class HistoryVC: UIViewController {
    
    let identifire = "historyCell"
    let api = ApiService()
    
    lazy var tableView = UITableView()
    lazy var totalPriceLabel = UILabel()
    
    var userVM = UserViewModel() {
        didSet {
            tableView.reloadData()
            updateTotalPrice()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        self.title = "HistoryButton".localize(tableName: DataSharing.shared.language)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userVM = DataSharing.shared.userVM
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        DataSharing.shared.userVM = userVM
    }
    
    func updateTotalPrice() {
        var totalPrice: Double = 0
        for (product,quantity) in userVM.users[userVM.idUser].cartProductHistory {
            totalPrice += product.price * Double(quantity)
        }
        totalPriceLabel.text = "\("Total".localize(tableName: DataSharing.shared.language)) \(totalPrice.format(f: "2"))"
    }
}

extension HistoryVC {
    
    func setupVC() {
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        configureTableVIew()
        configureTotalPriceLabel()
    }
    
    private func configureTableVIew() {
        self.view.addSubview(tableView)
        tableView.register(CartTableCell.self, forCellReuseIdentifier: identifire)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tintColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addConstraintTableView()
    }
    
    private func addConstraintTableView() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.9),
            tableView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func configureTotalPriceLabel() {
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLabel.text = "Total: $$$$"
        self.view.addSubview(totalPriceLabel)
        addConstraintTotalPriceLabel()
    }
    
    private func addConstraintTotalPriceLabel() {
        NSLayoutConstraint.activate([
            totalPriceLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            totalPriceLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8)
        ])
    }
}

extension HistoryVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

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
        cell.countQuantityLabel.text = "\(countQuantity[row]) шт."
    
        api.getRequestImageProduct(for: product[row].image) { UIImage in
            DispatchQueue.main.async {
                cell.image.image = UIImage
            }
        }
        return cell
    }
}
