//
//  MainCoordinator.swift
//  NiceTable_Example
//
//  Created by Felipe Frizeiro on 25/10/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator : Coordinator {

    weak var parent: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(_ navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainController()
        navigationController.pushViewController(vc, animated: false)
    }
    
    deinit {
        print("AppCoordinator deinit")
    }
    
}
