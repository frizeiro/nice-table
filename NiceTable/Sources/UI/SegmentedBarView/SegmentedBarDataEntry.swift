//
//  SegmentedBarDataEntry.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 07/04/24.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

class SegmentedBarDataEntry {
    
    // MARK: - Public Variables
    
    var label: String
    var value: CGFloat
    var color: UIColor

    // MARK: - Life Cycle
    
    init(
        label: String,
        value: CGFloat,
        color: UIColor
    ) {
        self.color = color
        self.label = label
        self.value = value
    }
    
}
