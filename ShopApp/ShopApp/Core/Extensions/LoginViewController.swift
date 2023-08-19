//
//  LoginVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 18.08.23.
//

import UIKit

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTF:
            passwordTF.becomeFirstResponder()
            
        case passwordTF:
            passwordTF.resignFirstResponder()
            
        default:
            break
        }
        return true
    }
}

extension LoginVC {
    
    func configureVC() {
        
        self.view.addSubview(imageFon)
        self.view.addSubview(scrollView)
        scrollView.addSubview(viewContainer)
        viewContainer.addSubview(infoLabel)
        viewContainer.addSubview(nameTF)
        viewContainer.addSubview(passwordTF)
        viewContainer.addSubview(rememberSwitch)
        viewContainer.addSubview(rememberLabel)
        viewContainer.addSubview(signInButton)
        viewContainer.addSubview(cancelButton)
        
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
        
        // MARK: - Создание переключателя "Запомнить"
        makeRemember()
        
        // MARK: - Создание текстового поля "Запомнить"
        makeRememberLabel()
        
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
        viewContainer.backgroundColor = .systemBackground
        viewContainer.layer.cornerRadius = 15
        
        addConstraintsViewConteiner()
    }
    
    private func addConstraintsViewConteiner() {
        NSLayoutConstraint.activate([
            viewContainer.bottomAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 16),
            viewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            viewContainer.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            viewContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    private func makeInfoLabel() {
        infoLabel.text = NSLocalizedString("InfoLogin", comment: "")
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
        nameTF.placeholder = NSLocalizedString("UserName", comment: "")
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
        passwordTF.placeholder = NSLocalizedString("Password", comment: "")
        passwordTF.returnKeyType = .done
        passwordTF.borderStyle = .roundedRect
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
    
    private func makeRemember() {
        rememberSwitch.contentMode = .right
        
        rememberSwitch.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsRememberSwitch()
    }
    
    private func addConstraintsRememberSwitch() {
        NSLayoutConstraint.activate([
            rememberSwitch.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 12),
            rememberSwitch.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor, constant: 0)
        ])
    }
    
    private func makeRememberLabel() {
        rememberLabel.text = NSLocalizedString("Remember", comment: "")
        rememberLabel.translatesAutoresizingMaskIntoConstraints = false
        rememberLabel.font = UIFont.boldSystemFont(ofSize: 10)
        addConstraintsRememberLabel()
    }
    
    private func addConstraintsRememberLabel() {
        NSLayoutConstraint.activate([
            rememberLabel.centerYAnchor.constraint(equalTo: rememberSwitch.centerYAnchor),
            rememberLabel.leadingAnchor.constraint(equalTo: rememberSwitch.trailingAnchor, constant: 8)
        ])
    }
    
    private func makeSignInButton() {
        signInButton.backgroundColor = .lightGray
        signInButton.layer.cornerRadius = 15
        signInButton.setTitle(NSLocalizedString("SignIn", comment: ""), for: .normal)
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
        cancelButton.setTitle(NSLocalizedString("Cancel", comment: ""), for: .normal)
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
    
    @objc
    private func signInOnClick() {
        configureTabBarController()
    }
    
    @objc
    private func cancelOnClick() {
        
    }
    
    private func configureTabBarController() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        
        let main = MainVC()
        let basket = BasketVC()
        let profile = ProfileVC()
        
        let mainNavController = UINavigationController(rootViewController: main)
        let basketNavController = UINavigationController(rootViewController: basket)
        let profileNavController = UINavigationController(rootViewController: profile)
        
        let tabBar = UITabBarController()
        tabBar.setViewControllers([mainNavController, basketNavController, profileNavController], animated: true)
        
        
        sceneDelegate.window?.rootViewController = tabBar
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
