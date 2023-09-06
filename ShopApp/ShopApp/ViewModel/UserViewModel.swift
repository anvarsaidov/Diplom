//
//  UserViewModel.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import Foundation

protocol UserProtocol {
    func logIn(userName: String, password: String) -> (Bool, Int)
    func addUser(for user: User) -> Bool
    func updatePassword(for userId: Int, password: String, firstName: String, lastName: String, email: String) -> Bool
    func logout()
}

final class UserViewModel: UserProtocol {
    // MARK: VarProperties
    var isLogged: Bool = false
    var idUser: Int = 0
    var users: [User] = []
    
    // MARK: LetProperties
    private let regexValidUserName = "^[a-z0-9_-]{3,12}$"
    private let regexValidName = "^[A-Za-z0-9_-]{2,12}$"
    private let regexValidPassword = "^[a-z0-9_-]{6,12}$"
    private let regexValidMail = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+.+.[A-Za-z]{2,4}$"
    
    private let api = ApiService()
    
    // MARK: - LogIn
    /// user login
    /// - Parameter userName: username
    ///                       password: password
    func logIn(userName: String, password: String) -> (Bool, Int) {
        var step = 0
        
        while step < users.count && !users.isEmpty && !isLogged {
            if users[step].userName != userName {
                step += 1
            } else if users[step].password != password {
                step += 1
            } else {
                isLogged = true
                idUser = step
            }
        }
        return (isLogged, idUser)
    }
    
    // MARK: - AddUser
    func addUser(for user: User) -> Bool {
        let isValid = valid(user: user)
        if findIndexUser(for: user) == nil && !isValid {
            return false
        } else {
            users.append(user)
            return true
        }
    }
    
    // MARK: - FindIndexUser
    func findIndexUser(for user: User) -> Int? {
        for (index, i) in users.enumerated() {
            if i.userName == user.userName {
                return index
            }
        }
        return nil
    }
    
    // MARK: - UpdateUser
    func updatePassword(for userId: Int, password: String, firstName: String, lastName: String, email: String) -> Bool {
        users[userId].password = password
        users[userId].firstName = firstName
        users[userId].lastName = lastName
        users[userId].email = email
        return true
    }
    
    // MARK: - Logout
    func logout() {
        isLogged = false
        idUser = 0
    }
    
    private func valid(user: User) -> Bool {
        let isValidUserName = user.userName.validateString(regexValidUserName)
        let isValidPassword = user.password.validateString(regexValidPassword)
        let isValidFirstName = user.firstName.validateString(regexValidName)
        let isValifLastName = user.lastName.validateString(regexValidName)
        let isValidEmail = user.email.validateString(regexValidMail)
        
        let isValid = (isValidUserName && isValidPassword && isValidFirstName && isValifLastName && isValidEmail) ? true : false
        
        return isValid
    }
}
