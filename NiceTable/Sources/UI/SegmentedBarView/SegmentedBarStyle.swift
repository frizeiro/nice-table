//
//  SegmentedBarStyle.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 07/04/24.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//


import Foundation

public class SegmentedBarStyle {
    
    // MARK: - Public Variables
    
    public static var `default` = SegmentedBarStyle()
    
    public var titleColor: UIColor
    public var titleFont: UIFont
    public var backgroundColor: UIColor
    public var labelColor: UIColor
    public var labelFont: UIFont
    
    // MARK: - Life Cycle
    
    init(
        titleColor: UIColor = ColorCompatibility.secondaryLabel,
        titleFont: UIFont = .preferredFont(forTextStyle: .footnote),
        backgroundColor: UIColor = ColorCompatibility.systemGroupedBackground,
        labelColor: UIColor = ColorCompatibility.secondaryLabel,
        labelFont: UIFont = .preferredFont(forTextStyle: .footnote)
    ) {
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.backgroundColor = backgroundColor
        self.labelColor = labelColor
        self.labelFont = labelFont
    }
    
}
