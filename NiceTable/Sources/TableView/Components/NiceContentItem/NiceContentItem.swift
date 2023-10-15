//
//  NiceContentItem.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 25/04/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

open class NiceContentItem: NiceTableItem, NiceDeletableItem {
    
    // MARK: - Public Variables
    
    public private(set) var description: NiceContentItemRepresentable
    public internal(set) var accessoryStyle: NiceContentAccessoryStyle
    
    public var deletedHandler: (() -> Void)?
    
    // MARK: - Overriden Variables
    
    open override var cellType: NiceTableCell.Type {
        return NiceContentCell.self
    }
    
    // MARK: - Life Cycle
    
    public init(_ description: NiceContentItemRepresentable, accessoryStyle: NiceContentAccessoryStyle = .none) {
        self.description = description
        self.accessoryStyle = accessoryStyle
    }
    
    public init(_ description: NiceContentItemDescription, accessoryStyle: NiceContentAccessoryStyle = .none) {
        self.description = description
        self.accessoryStyle = accessoryStyle
    }
    
}
