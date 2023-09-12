//
//  RegistrationVC+ TextField.swift
//  ShopApp
//
//  Created by AnvarSaidov on 12.09.23.
//

import UIKit.UITextField

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
            mailTF.becomeFirstResponder()

        case mailTF:
            mailTF.resignFirstResponder()
            
        default:
            break
        }
        return true
    }
}
