//
//  StartViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 6.09.23.
//

import UIKit

extension StartVC {
    func configureVC() {
        DataSharing.shared.language = getTableNameLanguage()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func getTableNameLanguage() -> String {
        let defaults = UserDefaults.standard
        guard let lang = defaults.string(forKey: "lang") else { return "LanguageEnglish" }
        return lang
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: MainVC(),
                title: "Main".localize(tableName: DataSharing.shared.language),
                image: UIImage(systemName: "homekit")
            ),
            generateVC(
                viewController: BasketVC(),
                title: "Cart".localize(tableName: DataSharing.shared.language),
                image: UIImage(systemName: "cart")
            ),
            generateVC(
                viewController: ProfileVC(),
                title: "Profile".localize(tableName: DataSharing.shared.language),
                image: UIImage(systemName: "person.crop.square")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return nav
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 0
        let positionOnY: CGFloat = 0
        let width = tabBar.bounds.width
        let height = tabBar.bounds.height
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
