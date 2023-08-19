//
//  Registration.swift
//  ShopApp
//
//  Created by AnvarSaidov on 17.08.23.
//

import UIKit

class RegistrationVC: UIViewController {
    
    let imageFon = UIImageView(image: UIImage(named: "welcomeImage"))
    let scrollView = UIScrollView()
    let viewContainer = UIView()
    let infoLabel = UILabel()
    let userNameTF = UITextField()
    let passwordTF = UITextField()
    let firstNameTF = UITextField()
    let lastNameTF = UITextField()
    let cityTF = UITextField()
    let streetTF = UITextField()
    let numberTF = UITextField()
    let phoneTF = UITextField()
    let signUpButton = UIButton()
    let cancelButton = UIButton()
    
    let spacingTop: CGFloat = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
}

