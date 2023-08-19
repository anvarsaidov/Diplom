//
//  RegistrationViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 18.08.23.
//

import UIKit

extension RegistrationVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTF:
            passwordTF.becomeFirstResponder()
            
        case passwordTF:
            firstNameTF.becomeFirstResponder()
            
        case firstNameTF:
            lastNameTF.becomeFirstResponder()
            
        case lastNameTF:
            cityTF.becomeFirstResponder()
            
        case cityTF:
            streetTF.becomeFirstResponder()
            
        case streetTF:
            numberTF.becomeFirstResponder()
            
        case numberTF:
            phoneTF.resignFirstResponder()
            
        default:
            break
        }
        return true
    }
}


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
        viewContainer.addSubview(cityTF)
        viewContainer.addSubview(streetTF)
        viewContainer.addSubview(numberTF)
        viewContainer.addSubview(phoneTF)
        viewContainer.addSubview(signUpButton)
        viewContainer.addSubview(cancelButton)
        
        buildVC()
        registerForKeyboardNotifications()
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
        
        // MARK: - Конфигурирование объекта lastNameTF
        configureLastNameTF()
        
        // MARK: - Конфигурирование объекта cityTF
        configureCityTF()
        
        // MARK: - Конфигурирование объекта streetTF
        configureStreetTF()
        
        // MARK: - Конфигурирование объекта numberTF
        configureNumberTF()
        
        // MARK: - Конфигурирование объекта phoneTF
        configurePhoneTF()
        
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
        addConstraintsFirstName()
    }
    
    private func addConstraintsFirstName() {
        NSLayoutConstraint.activate([
            firstNameTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.4),
            firstNameTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: spacingTop),
            firstNameTF.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor, constant: 0)
        ])
    }
    
    private func configureLastNameTF() {
        lastNameTF.placeholder = NSLocalizedString("LastName", comment: "")
        lastNameTF.returnKeyType = .continue
        lastNameTF.translatesAutoresizingMaskIntoConstraints = false
        lastNameTF.borderStyle = .roundedRect
        addConstraintsLastName()
    }
    
    private func addConstraintsLastName() {
        NSLayoutConstraint.activate([
            lastNameTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.4),
            lastNameTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: spacingTop),
            lastNameTF.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor, constant: 0)
        ])
    }
    
    private func configureCityTF() {
        cityTF.placeholder = NSLocalizedString("City", comment: "")
        cityTF.returnKeyType = .continue
        cityTF.translatesAutoresizingMaskIntoConstraints = false
        cityTF.borderStyle = .roundedRect
        addConstraintsCity()
    }
    
    private func addConstraintsCity() {
        NSLayoutConstraint.activate([
            cityTF.topAnchor.constraint(equalTo: firstNameTF.bottomAnchor, constant: spacingTop),
            cityTF.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            cityTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.9)
        ])
    }
    
    private func configureStreetTF() {
        streetTF.placeholder = NSLocalizedString("Street", comment: "")
        streetTF.returnKeyType = .continue
        streetTF.translatesAutoresizingMaskIntoConstraints = false
        streetTF.borderStyle = .roundedRect
        addConstraintsStreet()
    }
    
    private func addConstraintsStreet() {
        NSLayoutConstraint.activate([
            streetTF.topAnchor.constraint(equalTo: cityTF.bottomAnchor, constant: spacingTop),
            streetTF.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            streetTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.9)
        ])
    }
    
    private func configureNumberTF() {
        numberTF.placeholder = NSLocalizedString("Number", comment: "")
        numberTF.returnKeyType = .continue
        numberTF.translatesAutoresizingMaskIntoConstraints = false
        numberTF.borderStyle = .roundedRect
        addConstraintsNumber()
    }
    
    private func addConstraintsNumber() {
        NSLayoutConstraint.activate([
            numberTF.topAnchor.constraint(equalTo: streetTF.bottomAnchor, constant: spacingTop),
            numberTF.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            numberTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.9)
        ])
    }
    
    private func configurePhoneTF() {
        phoneTF.placeholder = NSLocalizedString("Phone", comment: "")
        phoneTF.returnKeyType = .continue
        phoneTF.translatesAutoresizingMaskIntoConstraints = false
        phoneTF.borderStyle = .roundedRect
        addConstraintsPhone()
    }
    
    private func addConstraintsPhone() {
        NSLayoutConstraint.activate([
            phoneTF.topAnchor.constraint(equalTo: numberTF.bottomAnchor, constant: spacingTop),
            phoneTF.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            phoneTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.9)
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
            signUpButton.topAnchor.constraint(equalTo: phoneTF.bottomAnchor, constant: spacingTop),
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
            cancelButton.topAnchor.constraint(equalTo: phoneTF.bottomAnchor, constant: spacingTop),
            cancelButton.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant:  8),
            cancelButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 4/10)
        ])
    }
    
    @objc
    private func signUpOnClick() {
        print("signUpOnClick")
    }
    
    @objc
    private func cancelOnClick() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        sceneDelegate.window?.rootViewController = WelcomeVC()
        sceneDelegate.window?.makeKeyAndVisible()
    }

    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: NSNotification.Name(UIResponder.keyboardWillShowNotification.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: NSNotification.Name(UIResponder.keyboardWillHideNotification.rawValue), object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    private func kbWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let kbFrameSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
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
}
