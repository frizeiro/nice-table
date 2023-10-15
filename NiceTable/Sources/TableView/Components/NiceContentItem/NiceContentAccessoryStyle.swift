//
//  NiceContentAccessoryStyle.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 17/05/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public enum NiceContentAccessoryStyle {
    
    case none
    case lookup
    case custom(UIView)
    case image(UIImage)
    
}

extension NiceContentAccessoryStyle {
    
    var accessoryType: UITableViewCell.AccessoryType {
        switch self {
        case .lookup:
            return .disclosureIndicator
        default:
            return .none
        }
    }
    
    var accessoryView: UIView? {
        switch self {
        case .custom(let view):
            return view
        case .image(let image):
            return UIImageView(image: image)
        default:
            return nil
        }
    }
    
}
