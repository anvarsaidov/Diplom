//
//  LoginVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 17.08.23.
//

import UIKit

class LoginVC: UIViewController {
    
    let imageFon = UIImageView(image: UIImage(named: "welcomeImage"))
    let scrollView = UIScrollView()
    let viewContainer = UIView()
    let infoLabel = UILabel()
    let nameTF = UITextField()
    let passwordTF = UITextField()
    let rememberSwitch = UISwitch()
    let rememberLabel = UILabel()
    let signInButton = UIButton()
    let cancelButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
}


