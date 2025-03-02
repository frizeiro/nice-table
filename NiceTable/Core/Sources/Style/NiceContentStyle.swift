//
//  NiceContentStyle.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 26/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public enum NiceContentStylePresentation {
    case inline
    case topDown
}

public struct NiceContentStyle {
    
    public static let shared = NiceContentStyle()
    
    public var iconSize: CGSize = CGSize(width: 40, height: 40)
    public var iconCornerRadius: CGFloat = 0
    public var iconBorderWidth: CGFloat = 0
    public var iconBorderColor: UIColor?
    
    public var presentation: NiceContentStylePresentation = .topDown
    
    public var titleFont: UIFont = .preferredFont(forTextStyle: .title2)
    public var labelFont: UIFont = .preferredFont(forTextStyle: .body)
    public var subtitleFont: UIFont = .preferredFont(forTextStyle: .subheadline)
    public var textFont: UIFont = .preferredFont(forTextStyle: .body)
    public var footerFont: UIFont = .preferredFont(forTextStyle: .footnote)
    
}

public extension NiceContentStyle {
    
    static var inline: NiceContentStyle {
        var style: NiceContentStyle = .shared
        style.presentation = .inline
        return style
    }
    
}
