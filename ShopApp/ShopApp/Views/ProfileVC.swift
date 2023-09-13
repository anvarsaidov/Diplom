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
    lazy var updateButton = UIButton()
    lazy var historyButton = UIButton()
    lazy var langButton = UIButton()
    lazy var segmentTheme = UISegmentedControl(items: ["Device".localize(tableName: DataSharing.shared.language),
                                                       "Light".localize(tableName: DataSharing.shared.language),
                                                       "Dark".localize(tableName: DataSharing.shared.language)])

    var userVM = UserViewModel() {
        didSet {
            updateVC()
        }
    }
    
    var cartViewModel = CartProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        let user = User(id: 1, userName: "Qwe", password: "qweqwe", firstName: "qwe", lastName: "qwe", email: "qwe@qwe.qw", cartProductHistory: [:])
//        let _ = userVM.addUser(for: user)
//        DataSharing.shared.userVM = userVM
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateVC()
        userVM = DataSharing.shared.userVM
        cartViewModel = DataSharing.shared.cartVM
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        DataSharing.shared.userVM = userVM
        DataSharing.shared.cartVM = cartViewModel
    }
}
