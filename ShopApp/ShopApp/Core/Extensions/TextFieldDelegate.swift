//
//  TextFieldDelegate.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
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

extension RegistrationVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTF:
            passwordTF.becomeFirstResponder()
            
        case passwordTF:
            passwordTF.resignFirstResponder()
            
//        case firstNameTF:
//            lastNameTF.becomeFirstResponder()
//
//        case lastNameTF:
//            cityTF.becomeFirstResponder()
//
//        case cityTF:
//            streetTF.becomeFirstResponder()
//
//        case streetTF:
//            numberTF.becomeFirstResponder()
//
//        case numberTF:
//            phoneTF.becomeFirstResponder()
//
//        case phoneTF:
//            phoneTF.resignFirstResponder()
//
            
        default:
            break
        }
        return true
    }
}
