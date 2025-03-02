//
//  NiceSectionStyle.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 24/05/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//q

import UIKit

public struct NiceSectionStyle {
    
    public static let shared = NiceSectionStyle()
    
    public var headerHeight: CGFloat = UITableView.automaticDimension
    public var footerHeight: CGFloat = UITableView.automaticDimension
    
    public var isHeaderHidden: Bool = false
    public var isFooterHidden: Bool = true
    
}

public extension NiceSectionStyle {
    
    static var noTitle: NiceSectionStyle {
        var style: NiceSectionStyle = .shared
        style.isHeaderHidden = true
        return style
    }
    
    static var withFooter: NiceSectionStyle {
        var style: NiceSectionStyle = .shared
        style.isFooterHidden = false
        return style
    }
    
    static var noTitleWithFooter: NiceSectionStyle {
        var style: NiceSectionStyle = .shared
        style.isHeaderHidden = true
        style.isFooterHidden = false
        return style
    }
    
}
