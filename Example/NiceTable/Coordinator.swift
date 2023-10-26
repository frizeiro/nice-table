//
//  Coordinator.swift
//  NiceTable_Example
//
//  Created by Felipe Frizeiro on 25/10/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    var parent: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}

extension Coordinator {
    
    func childDidFinish(_ coordinator : Coordinator) {
        children.removeAll { $0 === coordinator }
    }
    
}
