//
//  ProfileVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

class ProfileVC: UIViewController {
    lazy var imageFon = UIImageView(image: UIImage(named: "welcomeImage"))
    lazy var firstNameLabel = UILabel()
    lazy var lastNameLabel = UILabel()
    lazy var emailLabel = UILabel()
    lazy var historyButton = UIButton()
    lazy var signInButton = UIButton()
    lazy var signUpButton = UIButton()
    lazy var exitButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

private extension ProfileVC {
    func setup() {
        self.view.addSubview(imageFon)
        
        self.title = NSLocalizedString("Profile", comment: "")
        self.view.backgroundColor = .yellow
        self.tabBarItem = UITabBarItem(title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person.crop.square"), tag: 2)
        
        configureFirstNameLabel()
        configureLastNameLabel()
        configureEmailLabel()
        configureEngButton()
        configureRusButton()
        configureHistoryButton()
        configureSignInButton()
        configureSignUpButton()
        configureExitButton()
    }
    
    func configureFirstNameLabel() {
        firstNameLabel
    }
    
    func configureLastNameLabel() {
        
    }
    
    func configureEmailLabel() {
        
    }
    
    func configureEngButton() {
        
    }
    
    func configureRusButton() {
        
    }
    
    func configureHistoryButton() {
        
    }
    
    func configureSignInButton() {
        
    }
    
    func configureSignUpButton() {
        
    }
    
    func configureExitButton() {
        
    }
}
