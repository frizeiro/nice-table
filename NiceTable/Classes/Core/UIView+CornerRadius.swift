//
//  UIView+CornerRadius.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 26/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

extension UIView {

    var nCornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }

}
