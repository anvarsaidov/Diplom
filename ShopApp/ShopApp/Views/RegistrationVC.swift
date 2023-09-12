//
//  Registration.swift
//  ShopApp
//
//  Created by AnvarSaidov on 17.08.23.
//

import UIKit

class RegistrationVC: UIViewController {
    
   //lazy var imageFon = UIImageView(image: UIImage(named: "welcomeImage"))
    lazy var scrollView = UIScrollView()
    lazy var viewContainer = UIView()
    lazy var infoLabel = UILabel()
    lazy var userNameTF = UITextField()
    lazy var passwordTF = UITextField()
    lazy var firstNameTF = UITextField()
    lazy var lastNameTF = UITextField()
    lazy var mailTF = UITextField()
    lazy var signUpButton = UIButton()
    lazy var cancelButton = UIButton()
    
    let spacingTop: CGFloat = 12
    
    var viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
}
