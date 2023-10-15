//
//  UIView+Nib.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 10/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

extension UIView {
    
    static var nNibName: String {
        return String(describing: self)
    }
    
    var nNibName: String {
        return Self.nNibName
    }
    
    static var nNib: UINib {
        return UINib(nibName: nNibName, bundle: nBundle)
    }
    
    var nNib: UINib {
        return Self.nNib
    }
    
}

extension UIViewController {
    
    static var nNibName: String {
        return String(describing: self)
    }
    
    var nNibName: String {
        return Self.nNibName
    }
    
    static var nNib: UINib {
        return UINib(nibName: nNibName, bundle: nBundle)
    }
    
    var nNib: UINib {
        return Self.nNib
    }
    
}
