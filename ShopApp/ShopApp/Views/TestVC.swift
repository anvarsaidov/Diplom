//
//  TestVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 17.08.23.
//

import UIKit

class TestVC: UIViewController {
    
    let imageFon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "welcomeImage"))
        imageView.contentMode = .scaleAspectFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let viewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .red
        button.setTitle(NSLocalizedString("SignIn", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(nil, action: #selector(signInOnClick), for: .touchUpInside)
        
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .red
        button.setTitle(NSLocalizedString("SignUp", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(nil, action: #selector(signUpOnClick), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(imageFon)
        self.view.addSubview(viewContainer)
        viewContainer.addSubview(signInButton)
        viewContainer.addSubview(signUpButton)
        
        buildConstraints()
    }
    
    private func buildConstraints() {
        // MARK: - Ограничения для viewCintainer
        NSLayoutConstraint.activate([
            viewContainer.widthAnchor.constraint(equalToConstant: 300),
            viewContainer.heightAnchor.constraint(equalToConstant: 300),
            viewContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            viewContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        // MARK: - Ограничения для SignInButton
        NSLayoutConstraint.activate([
            signInButton.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor),
            signInButton.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 8/10),
            signInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // MARK: - Ограничения для SignUpButton
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 8),
            signUpButton.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 8/10),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    @objc
    private func signInOnClick() {
        print(NSLocalizedString("SignIn", comment: ""))
    }
    
    @objc
    private func signUpOnClick() {
        print(NSLocalizedString("SignUp", comment: ""))
    }
}
