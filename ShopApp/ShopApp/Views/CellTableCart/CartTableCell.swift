//
//  CartTableCell.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import UIKit

class CartTableCell: UITableViewCell {
    
    let view = UIView()
    let image = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCell()
        // Configure the view for the selected state
    }
    
}
