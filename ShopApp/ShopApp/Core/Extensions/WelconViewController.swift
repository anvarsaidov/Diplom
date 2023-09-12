//
//  WelconVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 17.08.23.
//

import UIKit

extension WelcomeVC {
    func builderVC() {
        
        // MARK: - imageFon
        let imageFon: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "welcomeImage"))
            imageView.contentMode = .scaleAspectFill
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        // MARK: - viewContainer
        let viewContainer: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        // MARK: - signInButton
        let signInButton: UIButton = {
            let button = UIButton()
            button.layer.cornerRadius = 10
            button.backgroundColor = .red
            button.setTitle("SignIn".localize(tableName: DataSharing.shared.language), for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.addTarget(nil, action: #selector(signInOnClick), for: .touchUpInside)
            
            return button
        }()        
        
        // MARK: - signUpButton
        let signUpButton: UIButton = {
            let button = UIButton()
            button.layer.cornerRadius = 10
            button.backgroundColor = .red
            button.setTitle("SignUp".localize(tableName: DataSharing.shared.language), for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.addTarget(nil, action: #selector(signUpOnClick), for: .touchUpInside)
            return button
        }()
        
        self.view.addSubview(imageFon)
        self.view.addSubview(viewContainer)
        viewContainer.addSubview(signInButton)
        viewContainer.addSubview(signUpButton)
        
        // MARK: - Ограничения для viewContainer
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
    
    // MARK: - Actions
    @objc
    private func signInOnClick() {
//        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
//        sceneDelegate.window?.rootViewController = LoginVC()
//        sceneDelegate.window?.makeKeyAndVisible()
        self.navigationController?.pushViewController(LoginVC(), animated: true)
    }
    
    @objc
    private func signUpOnClick() {
//        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
//        sceneDelegate.window?.rootViewController = RegistrationVC()
//        sceneDelegate.window?.makeKeyAndVisible()
        self.navigationController?.pushViewController(RegistrationVC(), animated: true)
    }
}
