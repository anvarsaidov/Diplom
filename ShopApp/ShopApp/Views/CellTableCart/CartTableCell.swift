//
//  CartTableCell.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import UIKit

class CartTableCell: UITableViewCell {
    
    lazy var view = UIView()
    lazy var image = UIImageView()
    lazy var titleLabel = UILabel()
    lazy var descriptionLabel = UILabel()
    lazy var priceLabel = UILabel()
    lazy var countQuantityLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        setupCell()
    }
    
}
