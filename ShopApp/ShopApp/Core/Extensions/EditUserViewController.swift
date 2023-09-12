//
//  EditUserViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 7.09.23.
//

import UIKit

extension EditUserVC {
    func setupVC() {
        self.title = "EditUserTitle".localize(tableName: DataSharing.shared.language)
        configurePasswordTextField()
        configureEditButton()
        configureCancelButton()
    }
    
    private func configurePasswordTextField() {
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.placeholder = "PasswordEdit".localize(tableName: DataSharing.shared.language)
        passwordTF.returnKeyType = .continue
        passwordTF.borderStyle = .roundedRect
        self.view.addSubview(passwordTF)
        addConstraintsPasswordTextField()
    }
    
    private func addConstraintsPasswordTextField() {
        NSLayoutConstraint.activate([
            passwordTF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            passwordTF.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            passwordTF.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            passwordTF.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1)
        ])
    }
    
    private func configureEditButton() {
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.setTitle("Accept".localize(tableName: DataSharing.shared.language), for: .normal)
        editButton.layer.cornerRadius = 10
        editButton.backgroundColor = .red
        editButton.setTitleColor(.black, for: .normal)
        editButton.addTarget(nil, action: #selector(acceptOnClick), for: .touchUpInside)
        self.view.addSubview(editButton)
        addConstraintsEditButton()
    }
    
    private func addConstraintsEditButton() {
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 16),
            editButton.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor),
            editButton.widthAnchor.constraint(equalTo: passwordTF.widthAnchor, multiplier: 0.4)
        ])
    }
    
    private func configureCancelButton() {
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle("Cancel".localize(tableName: DataSharing.shared.language), for: .normal)
        cancelButton.layer.cornerRadius = 10
        cancelButton.backgroundColor = .red
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.addTarget(nil, action: #selector(cancelOnClick), for: .touchUpInside)
        self.view.addSubview(cancelButton)
        addConstraintsCancelButton()
    }
    
    private func addConstraintsCancelButton() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 16),
            cancelButton.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor),
            cancelButton.widthAnchor.constraint(equalTo: passwordTF.widthAnchor, multiplier: 0.4)
        ])
    }
    
    
    // MARK: - Actions
    @objc
    private func acceptOnClick(sender: UIButton) {
        guard let text = passwordTF.text else { return }
        let result = userVM.updatePassword(for: userVM.idUser, password: text)
        if result.0 {
            showAlert(title: "Title".localize(tableName: DataSharing.shared.language), msg: result.1.msg.localize(tableName: DataSharing.shared.language))
        } else {
            showAlert(title: "Title".localize(tableName: DataSharing.shared.language), msg: result.1.msg.localize(tableName: DataSharing.shared.language))
        }
    }
    
    @objc
    private func cancelOnClick(sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    private func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title,
                                      message: msg,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok".localize(tableName: DataSharing.shared.language),
                                      style: .default,
                                      handler: { UIAlertAction in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
}
