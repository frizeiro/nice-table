//
//  UIView+Bundle.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 10/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

extension UIView {
    
    static var nBundle: Bundle {
        return Bundle(for: Self.self)
    }
    
    var nBundle: Bundle {
        return Self.nBundle
    }
    
}

extension UIViewController {
    
    static var nBundle: Bundle {
        return Bundle(for: Self.self)
    }
    
    var nBundle: Bundle {
        return Self.nBundle
    }
    
}
