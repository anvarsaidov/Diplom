//
//  LoginVC+TextField.swift
//  ShopApp
//
//  Created by AnvarSaidov on 12.09.23.
//

import UIKit.UITextField

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
