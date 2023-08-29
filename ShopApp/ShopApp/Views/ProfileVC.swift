//
//  ProfileVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

class ProfileVC: UIViewController {
    
    let textSize: CGFloat = 18
    let spacingTop: CGFloat = 16
    
    // MARK: - Объявление объектов
    lazy var viewContainer = UIView()
    lazy var firstNameLabel = UILabel()
    lazy var lastNameLabel = UILabel()
    lazy var emailLabel = UILabel()
    lazy var signInButton = UIButton()
    lazy var signUpButton = UIButton()
    lazy var exitButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
