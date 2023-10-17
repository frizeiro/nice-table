//
//  NiceSectionStyle.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 24/05/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public struct NiceSectionStyle {
    
    public static let shared = NiceSectionStyle()
    
    public var headerHeight: CGFloat = 40
    public var footerHeight: CGFloat = 30
    
    public var isHeaderHidden: Bool = false
    public var isFooterHidden: Bool = true
    
}
