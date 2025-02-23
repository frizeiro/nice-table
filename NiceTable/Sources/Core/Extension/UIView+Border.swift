//
//  UIView+Border.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 26/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

extension UIView {

    var nBorderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    var nBorderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let layerBorderColor = layer.borderColor else { return nil }
            return UIColor(cgColor: layerBorderColor)
        }
    }

}
