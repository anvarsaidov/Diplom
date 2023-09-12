//
//  ReturnValid.swift
//  ShopApp
//
//  Created by AnvarSaidov on 7.09.23.
//

import Foundation

enum ReturnValid {
    case noUser
    case noValidTextFields
    case addUser
    case editUser
    
    var msg: String {
        switch self {
        case .noUser:
            return "NoUser"
            
        case .noValidTextFields:
            return "NoValidTextFields"
            
        case .addUser:
            return "AddUser"
            
        case .editUser:
            return "EditUser"
        }
        
    }
}
