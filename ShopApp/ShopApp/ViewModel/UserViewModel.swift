//
//  UserViewModel.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import Foundation

final class UserViewModel {
    
    // MARK: VarProperties
    var isLogged: Bool = false
    var idUser: Int = 0
    var users: [User] = []
    
    // MARK: LetProperties
    private let regexValidUserName = "^[A-Za-z0-9_-]{3,12}$"
    private let regexValidName = "^[A-Za-z0-9_-]{2,12}$"
    private let regexValidPassword = "^[A-Za-z0-9_-]{6,12}$"
    private let regexValidMail = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+.+.[A-Za-z]{2,4}$"
    
    private let api = ApiService()
    
    // MARK: - LogIn
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
    func addUser(for user: User) -> (Bool, ReturnValid) {
        let isValid = valid(user: user)
        let index = findIndexUser(for: user)
        
        if !isValid {
            return (false, .noValidTextFields)
        }
        
        if index != nil {
            return (false, .noUser)
        }
        
        users.append(user)
        return (true, .addUser)
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
    func updatePassword(for userId: Int, password: String) -> (Bool, ReturnValid) {
        let isValidPassword = password.validateString(regexValidPassword)
        if isValidPassword {
            users[userId].password = password
            return (true, .editUser)
        } else {
            return (false, .noValidTextFields)
        }
    }
    
    // MARK: - Logout
    func logout() {
        isLogged = false
        idUser = 0
    }
    
    // MARK: - Получить корзину заказов пользователя (История)
    func getCartUser(idUser: Int, complition: (([ProductElement : Int]) -> Void?)) {
        let result = users[idUser].cartProductHistory
        complition(result)
    }
    
    func addToCart(addProduct: ProductElement, quantity: Int) {
        let products = users[idUser].cartProductHistory.map({$0.key})
        // если у нас нет продуктов, мы просто создаем его с нашим количеством и выходим из функции
        if products.isEmpty {
            users[idUser].cartProductHistory[addProduct] = quantity
            return
        }
        for product in products {
            // если товар у нас уже есть, мы проверяем наш товар и добавляем количество
            if addProduct.id == product.id {
                users[idUser].cartProductHistory[product]! += quantity
            } else {
                // если у нас есть продукты, но нет этого, мы создаем его с количеством
                if !products.contains(where: { $0.id == addProduct.id }) {
                    users[idUser].cartProductHistory[addProduct] = quantity
                }
            }
        }
    }
    
    // MARK: - Проверка на корректность полей при регистрации
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
