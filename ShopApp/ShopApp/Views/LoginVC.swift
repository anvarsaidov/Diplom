//
//  LoginVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 17.08.23.
//

import UIKit

class LoginVC: UIViewController {
    
    //lazy var imageFon = UIImageView(image: UIImage(named: "welcomeImage"))
    lazy var scrollView = UIScrollView()
    lazy var viewContainer = UIView()
    lazy var infoLabel = UILabel()
    lazy var nameTF = UITextField()
    lazy var passwordTF = UITextField()
    lazy var signInButton = UIButton()
    lazy var cancelButton = UIButton()
    
    var viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
}


