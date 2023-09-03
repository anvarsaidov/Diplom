//
//  SceneDelegate.swift
//  ShopApp
//
//  Created by AnvarSaidov on 27.07.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let main = MainVC()
        let basket = BasketVC()
        let profile = ProfileVC()
        
        let mainNavController = UINavigationController(rootViewController: main)
        let basketNavController = UINavigationController(rootViewController: basket)
        let profileNavController = UINavigationController(rootViewController: profile)
        
        let tabBar = UITabBarController()
        tabBar.setViewControllers([mainNavController, basketNavController, profileNavController], animated: true)
        
        tabBar.viewControllers?[0].tabBarItem = UITabBarItem(title: NSLocalizedString("Main", comment: ""), image: UIImage(systemName: "homekit"), tag: 0)
        tabBar.viewControllers?[1].tabBarItem = UITabBarItem(title: NSLocalizedString("Cart", comment: ""), image: UIImage(systemName: "cart"), tag: 1)
        tabBar.viewControllers?[2].tabBarItem = UITabBarItem(title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person.crop.square"), tag: 2)
        
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
        
        self.window = window
        
    }
}
