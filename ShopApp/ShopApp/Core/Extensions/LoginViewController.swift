//
//  LoginVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 18.08.23.
//

import UIKit

extension LoginVC {
    
    func configureVC() {
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        self.view.addSubview(scrollView)
        scrollView.addSubview(viewContainer)
        viewContainer.addSubview(infoLabel)
        viewContainer.addSubview(nameTF)
        viewContainer.addSubview(passwordTF)
        viewContainer.addSubview(signInButton)
        viewContainer.addSubview(cancelButton)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture)))
        
        [nameTF, passwordTF].forEach {
            $0?.delegate = self
        }
        
        buildVC()
        registerForKeyboardNotifications()
    }
    
    private func buildVC() {
        // MARK: - Создание ScrollView
        makeScrollView()
        
        // MARK: - Создание контэйнера для объектов
        makeViewContainer()
        
        // MARK: - Создание label наименования окна
        makeInfoLabel()
        
        // MARK: - Создание текстового поля "Имя пользователя"
        makeNameTF()
       
        // MARK: - Создание текстового поля "Пароль"
        makePasswordTF()
        
        // MARK: - Создание кнопки "Войти"
        makeSignInButton()
        
        // MARK: - Создание кнопки "Отмена (Вернуться на предыдущее окно"
        makeCancelButton()
    }
    
    private func makeScrollView() {
        let contentSizeScrollView = CGSize(width: self.view.frame.width, height: self.view.frame.width)
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
    
    private func makeViewContainer() {
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.layer.cornerRadius = 15
        
        addConstraintsViewConteiner()
    }
    
    private func addConstraintsViewConteiner() {
        NSLayoutConstraint.activate([
            viewContainer.bottomAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 16),
            viewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            viewContainer.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            viewContainer.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func makeInfoLabel() {
        infoLabel.text = "InfoLogin".localize(tableName: DataSharing.shared.language)
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsInfoLabel()
    }
    
    private func addConstraintsInfoLabel() {
        NSLayoutConstraint.activate([
            infoLabel.widthAnchor.constraint(equalTo: viewContainer.widthAnchor),
            infoLabel.heightAnchor.constraint(equalToConstant: 40),
            infoLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 16),
            infoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    private func makeNameTF() {
        nameTF.placeholder = "UserName".localize(tableName: DataSharing.shared.language)
        nameTF.returnKeyType = .continue
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.borderStyle = .roundedRect
        addConstraintsNameTF()
    }
    
    private func addConstraintsNameTF() {
        NSLayoutConstraint.activate([
            nameTF.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 12),
            nameTF.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            nameTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.8)
        ])
    }
    
    private func makePasswordTF() {
        passwordTF.placeholder = "Password".localize(tableName: DataSharing.shared.language)
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
            passwordTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 12),
            passwordTF.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            passwordTF.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.8)
        ])
    }
    
    private func makeSignInButton() {
        signInButton.backgroundColor = .lightGray
        signInButton.layer.cornerRadius = 15
        signInButton.setTitle("SignIn".localize(tableName: DataSharing.shared.language), for: .normal)
        signInButton.setTitleColor(UIColor.black, for: .normal)
        signInButton.addTarget(nil, action: #selector(signInOnClick), for: .touchUpInside)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsSignInButton()
    }
    
    private func addConstraintsSignInButton() {
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 12),
            signInButton.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor, constant:  0),
            signInButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.4)
        ])
    }
    
    private func makeCancelButton() {
        cancelButton.backgroundColor = .lightGray
        cancelButton.layer.cornerRadius = 15
        cancelButton.setTitle("Cancel".localize(tableName: DataSharing.shared.language), for: .normal)
        cancelButton.setTitleColor(UIColor.black, for: .normal)
        cancelButton.addTarget(nil, action: #selector(cancelOnClick), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsCancelButton()
    }
    
    private func addConstraintsCancelButton() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 12),
            cancelButton.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor, constant:  0),
            cancelButton.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.4)
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
    private func signInOnClick() {
        guard let name = nameTF.text else { return }
        guard let password = passwordTF.text else { return }
        
        let (isLogIn, _) = viewModel.logIn(userName: name, password: password)
        if isLogIn {
            let alert = UIAlertController(title: "titleAlertLogIn".localize(tableName: DataSharing.shared.language),
                                          message: "msgAlertLogIn".localize(tableName: DataSharing.shared.language),
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok".localize(tableName: DataSharing.shared.language),
                                          style: .default, handler: { _ in 
                guard let vc = self.navigationController?.viewControllers.first as? ProfileVC else { return }
                vc.userVM = self.viewModel
                vc.signInButton.isHidden = true
                vc.signUpButton.isHidden = true
                vc.exitButton.isHidden = false
                self.navigationController?.viewControllers = [vc]
            }))
            self.present(alert, animated: true)
            
        } else {
            let alert = UIAlertController(title: "titleAlertLogIn".localize(tableName: DataSharing.shared.language),
                                          message: "msgAlertLogInNo".localize(tableName: DataSharing.shared.language),
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok".localize(tableName: DataSharing.shared.language),
                                          style: .default))
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
        nameTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
}
