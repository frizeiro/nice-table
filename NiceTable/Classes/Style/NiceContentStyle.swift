//
//  NiceContentStyle.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 26/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public struct NiceContentStyle {
    
    public static let shared = NiceContentStyle()
    
    public var iconSize: CGSize = CGSize(width: 40, height: 40)
    public var iconCornerRadius: CGFloat = 0
    public var iconBorderWidth: CGFloat = 0
    public var iconBorderColor: UIColor?
    
    public var presentation: NiceContentStylePresentation = .topDown
    
}

public enum NiceContentStylePresentation {
    case inline
    case topDown
}
