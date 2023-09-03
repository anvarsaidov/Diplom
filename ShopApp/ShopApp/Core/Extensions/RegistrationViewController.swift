//
//  RegistrationViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 18.08.23.
//

import UIKit

extension RegistrationVC {
    func setupVC() {
        self.view.addSubview(imageFon)
        self.view.addSubview(scrollView)
        scrollView.addSubview(viewContainer)
        viewContainer.addSubview(infoLabel)
        viewContainer.addSubview(userNameTF)
        viewContainer.addSubview(passwordTF)
        viewContainer.addSubview(firstNameTF)
        viewContainer.addSubview(lastNameTF)
        viewContainer.addSubview(mailTF)
        viewContainer.addSubview(signUpButton)
        viewContainer.addSubview(cancelButton)
        
        buildVC()
        
        [userNameTF, passwordTF].forEach {
            $0?.delegate = self
        }
        
        registerForKeyboardNotifications()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture)))
        
    }
    
    private func buildVC() {
        // MARK: - Конфигурирование объекта scrollView
        configureScrollView()
        
        // MARK: - Конфигурирование объекта viewContainer
        configureViewContainer()
        
        // MARK: - Конфигурирование объекта infoLabel
        configureInfoLabel()
        
        // MARK: - Конфигурирование объекта userNameTF
        configureUserNameTF()
        
        // MARK: - Конфигурирование объекта passwordTF
        configurePasswordTF()
        
        // MARK: - Конфигурирование объекта firstNameTF
        configureFirstNameTF()
//
//        // MARK: - Конфигурирование объекта lastNameTF
        configureLastNameTF()

//        // MARK: - Конфигурирование объекта mailTF
        configureMailTF()
        
        // MARK: - Конфигурирование объекта signUpButton
        configureSignUpButton()
        
        // MARK: - Конфигурирование объекта cancelButton
        configureCancelButton()
    }
    
    private func configureScrollView() {
        let contentSizeScrollView = CGSize(width: self.view.frame.width, height: self.view.frame.width + 100)
        scrollView.contentSize = contentSizeScrollView
        scrollView.frame = self.view.bounds
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsScrollView()
    }
    
    private func addConstraintsScrollView() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1),
            scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1)
        ])
    }
    
    private func configureViewContainer() {
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.backgroundColor = .systemBackground
        viewContainer.layer.cornerRadius = 15
        
        addConstraintsViewConteiner()
    }
    
    private func addConstraintsViewConteiner() {
        NSLayoutConstraint.activate([
            viewContainer.bottomAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 16),
            viewContainer.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            viewContainer.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            viewContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    private func configureInfoLabel() {
        infoLabel.text = NSLocalizedString("InfoRegistration", comment: "")
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsInfoLabel()
    }
    
    private func addConstraintsInfoLabel() {
        NSLayoutConstraint.activate([
            infoLabel.widthAnchor.constraint(equalTo: viewContainer.widthAnchor),
            infoLabel.heightAnchor.constraint(equalToConstant: 40),
            infoLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: spacingTop),
            infoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    private func configureUserNameTF() {
        userNameTF.placeholder = NSLocalizedString("UserName", comment: "")
        userNameTF.returnKeyType = .continue
        userNameTF.translatesAutoresizingMaskIntoConstraints = false
        userNameTF.borderStyle = .roundedRect
        addConstraintsUserNameTF()
    }
    
    private func addConstraintsUserNameTF() {
        NSLayoutConstraint.activate([
            userNameTF.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: spacingTop),
            userNameTF.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            userNameTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.9)
        ])
    }
    
    private func configurePasswordTF() {
        passwordTF.placeholder = NSLocalizedString("Password", comment: "")
        passwordTF.returnKeyType = .done
        passwordTF.borderStyle = .roundedRect
        passwordTF.isSecureTextEntry = true
        passwordTF.autocorrectionType = .no
        passwordTF.textContentType = .oneTimeCode
        passwordTF.keyboardType = .default
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsPasswordTF()
    }
    
    private func addConstraintsPasswordTF() {
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: spacingTop),
            passwordTF.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            passwordTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.9)
        ])
    }
    
    private func configureFirstNameTF() {
        firstNameTF.placeholder = NSLocalizedString("FirstName", comment: "")
        firstNameTF.returnKeyType = .continue
        firstNameTF.translatesAutoresizingMaskIntoConstraints = false
        firstNameTF.borderStyle = .roundedRect
        firstNameTF.keyboardType = .default
        addConstraintsFirstName()
    }

    private func addConstraintsFirstName() {
        NSLayoutConstraint.activate([
            firstNameTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.9),
            firstNameTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: spacingTop),
            firstNameTF.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor)
        ])
    }

    private func configureLastNameTF() {
        lastNameTF.placeholder = NSLocalizedString("LastName", comment: "")
        lastNameTF.returnKeyType = .continue
        lastNameTF.translatesAutoresizingMaskIntoConstraints = false
        lastNameTF.borderStyle = .roundedRect
        lastNameTF.keyboardType = .default
        addConstraintsLastName()
    }

    private func addConstraintsLastName() {
        NSLayoutConstraint.activate([
            lastNameTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.9),
            lastNameTF.topAnchor.constraint(equalTo: firstNameTF.bottomAnchor, constant: spacingTop),
            lastNameTF.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor)
        ])
    }

    private func configureMailTF() {
        mailTF.placeholder = NSLocalizedString("Mail", comment: "")
        mailTF.returnKeyType = .continue
        mailTF.translatesAutoresizingMaskIntoConstraints = false
        mailTF.borderStyle = .roundedRect
        mailTF.keyboardType = .emailAddress
        addConstraintsMail()
    }

    private func addConstraintsMail() {
        NSLayoutConstraint.activate([
            mailTF.topAnchor.constraint(equalTo: lastNameTF.bottomAnchor, constant: spacingTop),
            mailTF.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            mailTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.9)
        ])
    }

    private func configureSignUpButton() {
        signUpButton.backgroundColor = .lightGray
        signUpButton.layer.cornerRadius = 15
        signUpButton.setTitle(NSLocalizedString("SignUp", comment: ""), for: .normal)
        signUpButton.setTitleColor(UIColor.black, for: .normal)
        signUpButton.addTarget(nil, action: #selector(signUpOnClick), for: .touchUpInside)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsSignUpButton()
    }

    private func addConstraintsSignUpButton() {
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: mailTF.bottomAnchor, constant: spacingTop),
            signUpButton.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant:  -8),
            signUpButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 5/10)
        ])
    }

    private func configureCancelButton() {
        cancelButton.backgroundColor = .lightGray
        cancelButton.layer.cornerRadius = 15
        cancelButton.setTitle(NSLocalizedString("Cancel", comment: ""), for: .normal)
        cancelButton.setTitleColor(UIColor.black, for: .normal)
        cancelButton.addTarget(nil, action: #selector(cancelOnClick), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsCancelButton()
    }

    private func addConstraintsCancelButton() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: mailTF.bottomAnchor, constant: spacingTop),
            cancelButton.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant:  8),
            cancelButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 4/10)
        ])
    }

    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: NSNotification.Name(UIResponder.keyboardWillShowNotification.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: NSNotification.Name(UIResponder.keyboardWillHideNotification.rawValue), object: nil)
    }

    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - Actions
    @objc
    private func signUpOnClick() {
        
        guard let name = userNameTF.text else { return }
        guard let password = passwordTF.text else { return }
        guard let firstName = firstNameTF.text else { return }
        guard let lastName = lastNameTF.text else { return }
        guard let email = mailTF.text else { return }
        
        let id = viewModel.users.count + 1
        let userAdd = User(id: id, userName: name, password: password, firstName: firstName, lastName: lastName, email: email)
        
        let isAdd = viewModel.addUser(for: userAdd)
        if isAdd {
            let alert = UIAlertController(title: "Сообщение", message: "Пользователь зарегестрирован", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                let loginVC = LoginVC()
                loginVC.viewModel = self.viewModel
                self.navigationController?.pushViewController(loginVC, animated: true)
            }))
            self.present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Сообщение", message: "Пользователь \(name) уже существует.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }

    @objc
    private func cancelOnClick() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func kbWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let kbFrameSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        //let offSet = viewContainer.frame.minY + viewContainer.frame.height - (cancelButton.frame.minY + cancelButton.frame.height)
        let offSet = viewContainer.frame.minY + viewContainer.frame.height - (cancelButton.frame.minY + cancelButton.frame.height)
        
        if kbFrameSize.cgRectValue.height > offSet {
            UIView.animate(withDuration: 0.3, delay: 0) {
                self.scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.cgRectValue.height - offSet)
            }
        }
    }
    
    @objc
    private func kbWillHide() {
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.scrollView.contentOffset = CGPoint.zero
        }
    }
    
    @objc
    private func tapGesture() {
        userNameTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        firstNameTF.resignFirstResponder()
        lastNameTF.resignFirstResponder()
        mailTF.resignFirstResponder()
    }
    
    func showAlert(title: String, msg: String, titleAction: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: titleAction, style: .default))
        self.present(alert, animated: true)
    }
}
