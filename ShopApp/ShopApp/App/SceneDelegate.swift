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
        
        window.makeKeyAndVisible()
        window.rootViewController = StartVC()
        window.overrideUserInterfaceStyle = AppTheme.shared.theme.getUserInterfaceStyle()
        self.window = window
    }
}
