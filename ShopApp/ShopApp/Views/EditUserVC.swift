//
//  EditUserVC.swift
//  ShopApp
//
//  Created by AnvarSaidov on 7.09.23.
//

import UIKit

class EditUserVC: UIViewController {
    
    lazy var passwordTF = UITextField()
    lazy var editButton = UIButton()
    lazy var cancelButton = UIButton()
    
    var userVM = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userVM = DataSharing.shared.userVM
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        DataSharing.shared.userVM = userVM
    }
}
