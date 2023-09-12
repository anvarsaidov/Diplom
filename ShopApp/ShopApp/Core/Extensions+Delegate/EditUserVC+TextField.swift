//
//  TextFieldDelegate.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import UIKit.UITextField

extension EditUserVC: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            
        case passwordTF:
            passwordTF.becomeFirstResponder()
            
        default:
            break
        }
        
        return true
    }
}
