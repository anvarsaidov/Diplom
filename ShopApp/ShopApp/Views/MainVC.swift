//
//  Main.swift
//  ShopApp
//
//  Created by AnvarSaidov on 19.08.23.
//

import UIKit

class MainVC: UIViewController {
    
    let imageFon = UIImageView(image: UIImage(named: "welcomeImage"))
//    let searchTF = UITextField()
//    let viewContainer = UITextField()
//    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupVC()
        self.view.addSubview(imageFon)
        self.title = NSLocalizedString("Main", comment: "")
        self.tabBarItem = UITabBarItem(title: NSLocalizedString("Main", comment: ""), image: UIImage(systemName: "homekit"), tag: 0)
        self.view.backgroundColor = .purple
        
        
    }
}

//extension MainVC {
//
//    func setupVC() {
//        buildVC()
//    }
//
//    private func buildVC() {
//    }
//
//    private func configureSearchTF() {
//
//    }
//
//    private func configureViewContainer() {
//
//    }
//
//    private func configureTableView() {
//
//    }
//
//    private func configureTabBar() {
//
//    }
//}
