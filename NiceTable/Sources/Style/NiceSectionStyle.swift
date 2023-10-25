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
    
    public var headerHeight: CGFloat = UITableView.automaticDimension
    public var footerHeight: CGFloat = UITableView.automaticDimension
    
    public var isHeaderHidden: Bool = false
    public var isFooterHidden: Bool = true
    
}
