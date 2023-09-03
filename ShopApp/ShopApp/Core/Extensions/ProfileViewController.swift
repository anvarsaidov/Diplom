//
//  ProfileViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

extension ProfileVC {
    func setup() {
        
        self.title = NSLocalizedString("Profile", comment: "")
        self.view.backgroundColor = .white
        
        // MARK: - Конфигурирование объекта ViewContainer
        configureViewContainer()
        
        // MARK: - Конфигурирование объекта FirstNameLabel
        configureFirstNameLabel()
        
        // MARK: - Конфигурирование объекта LastNameLabel
        configureLastNameLabel()
        
        // MARK: - Конфигурирование объекта EmailLabel
        configureEmailLabel()
        
        configureUpdateButton()
        
        configureHistoryButton()
        
        // MARK: - Конфигурирование объекта ExitButton
        configureExitButton()
        
        // MARK: - Конфигурирование объекта SignUpButton
        configureSignUpButton()
        
        // MARK: - Конфигурирование объекта SignInButton
        configureSignInButton()
        
    }
    
    private func configureViewContainer() {
        
        viewContainer.backgroundColor = .systemBackground
        viewContainer.layer.cornerRadius = 15
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(viewContainer)
        addConstraintViewContainer()
    }
    
    // MARK: - Установка ограничений для объекта ViewContainer
    private func addConstraintViewContainer() {
        NSLayoutConstraint.activate([
            viewContainer.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8),
            viewContainer.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            viewContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            viewContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    private func configureFirstNameLabel() {
        firstNameLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        firstNameLabel.textAlignment = .center
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.addSubview(firstNameLabel)
        addConstraintsFirstNameLabel()
    }
    
    // MARK: - Установка ограничений для объекта FirstNameLabel
    private func addConstraintsFirstNameLabel() {
        NSLayoutConstraint.activate([
            firstNameLabel.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            firstNameLabel.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.8),
            firstNameLabel.heightAnchor.constraint(equalToConstant: 40),
            firstNameLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: spacingTop)
        ])
    }
    
    private func configureLastNameLabel() {
        lastNameLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        lastNameLabel.textAlignment = .center
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.addSubview(lastNameLabel)
        addConstraintsLastNameLabel()
    }
    
    // MARK: - Установка ограничений для объекта LastNameLabel
    private func addConstraintsLastNameLabel() {
        NSLayoutConstraint.activate([
            lastNameLabel.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            lastNameLabel.widthAnchor.constraint(equalTo: firstNameLabel.widthAnchor, multiplier: 1),
            lastNameLabel.heightAnchor.constraint(equalTo: firstNameLabel.heightAnchor, multiplier: 1),
            lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: spacingTop)
        ])
    }
    
    private func configureEmailLabel() {
        emailLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        emailLabel.textAlignment = .center
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.addSubview(emailLabel)
        addConstraintsEmailLabel()
    }

    // MARK: - Установка ограничений для объекта EmailLabel
    private func addConstraintsEmailLabel() {
        NSLayoutConstraint.activate([
            emailLabel.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            emailLabel.widthAnchor.constraint(equalTo: lastNameLabel.widthAnchor, multiplier: 1),
            emailLabel.heightAnchor.constraint(equalTo: lastNameLabel.heightAnchor, multiplier: 1),
            emailLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: spacingTop)
        ])
    }
    
    private func configureUpdateButton() {
        updateButton.layer.cornerRadius = 10
        updateButton.backgroundColor = .red
        updateButton.setTitle(NSLocalizedString("UpdateButton", comment: ""), for: .normal)
        updateButton.setTitleColor(.black, for: .normal)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.addTarget(nil, action: #selector(updateOnClick), for: .touchUpInside)
        
        viewContainer.addSubview(updateButton)
        addConstraintsUpdateButton()
    }
    
    private func addConstraintsUpdateButton() {
        NSLayoutConstraint.activate([
            updateButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 32),
            updateButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.5),
            updateButton.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor)
        ])
    }
    
    private func configureHistoryButton() {
        historyButton.layer.cornerRadius = 10
        historyButton.backgroundColor = .red
        historyButton.setTitle(NSLocalizedString("HistoryButton", comment: ""), for: .normal)
        historyButton.setTitleColor(.black, for: .normal)
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        historyButton.addTarget(nil, action: #selector(historyOnClick), for: .touchUpInside)
        
        viewContainer.addSubview(historyButton)
        addConstraintsHistoryButton()
    }
    
    private func addConstraintsHistoryButton() {
        NSLayoutConstraint.activate([
            historyButton.topAnchor.constraint(equalTo: updateButton.bottomAnchor, constant: 16),
            historyButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.5),
            historyButton.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor)
        ])
    }
    
    private func configureSignInButton() {
        signInButton.layer.cornerRadius = 10
        signInButton.backgroundColor = .red
        signInButton.setTitle(NSLocalizedString("SignIn", comment: ""), for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(nil, action: #selector(signInOnClick), for: .touchUpInside)
        
        viewContainer.addSubview(signInButton)
        addConstraintsSignInButton()
    }
    
    // MARK: - Установка ограничений для объекта SignInButton
    private func addConstraintsSignInButton() {
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.5),
            signInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -16)
        ])
    }
    
    private func configureSignUpButton() {
        signUpButton.layer.cornerRadius = 10
        signUpButton.backgroundColor = .red
        signUpButton.setTitle(NSLocalizedString("SignUp", comment: ""), for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(nil, action: #selector(signUpOnClick), for: .touchUpInside)
        viewContainer.addSubview(signUpButton)
        addConstraintsSignUpButton()
    }
    
    // MARK: - Установка ограничений для объекта SignUpButton
    private func addConstraintsSignUpButton() {
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.5),
            signUpButton.bottomAnchor.constraint(equalTo: exitButton.topAnchor, constant: -16)
        ])
    }
    
    private func configureExitButton() {
        exitButton.layer.cornerRadius = 10
        exitButton.backgroundColor = .red
        exitButton.setTitle(NSLocalizedString("Exit", comment: ""), for: .normal)
        exitButton.setTitleColor(.black, for: .normal)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.isHidden = true
        exitButton.addTarget(nil, action: #selector(exitOnClick), for: .touchUpInside)
        viewContainer.addSubview(exitButton)
        addConstraintsExitButton()
    }
    
    // MARK: - Установка ограничений для объекта ExitButton
    private func addConstraintsExitButton() {
        NSLayoutConstraint.activate([
            exitButton.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            exitButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.5),
            exitButton.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Обновление вью после логина\выход из акаунта
    func update() {
        if !viewModel.users.isEmpty && viewModel.isLogged {
            firstNameLabel.text = viewModel.users[viewModel.idUser].firstName
            lastNameLabel.text = viewModel.users[viewModel.idUser].lastName
            emailLabel.text = viewModel.users[viewModel.idUser].email
            signInButton.isHidden = true
            signUpButton.isHidden = true
            updateButton.isHidden = false
            historyButton.isHidden = false
            exitButton.isHidden = false
        } else {
            firstNameLabel.text = ""
            lastNameLabel.text = ""
            emailLabel.text = ""
            updateButton.isHidden = true
            historyButton.isHidden = true
            signInButton.isHidden = false
            signUpButton.isHidden = false
            exitButton.isHidden = true
        }
    }
    
    // MARK: - Actions Button
    @objc
    private func signInOnClick() {
        let vc = LoginVC()
        vc.viewModel = self.viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func signUpOnClick() {
        let vc = RegistrationVC()
        vc.viewModel = self.viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func exitOnClick() {
        print(viewModel.isLogged)
        viewModel.logout()
        update()
    }
    
    @objc
    private func updateOnClick() {
        print(#function)
    }
    
    @objc
    private func historyOnClick() {
        print(#function)
    }
}

