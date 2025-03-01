//
//  NiceTableItem.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 25/04/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

open class NiceTableItem {
    
    // MARK: - Public Variables
    
    open var cellType: NiceTableCell.Type {
        fatalError("\(type(of: self)).cellType needs to be overwritten.")
    }
    
    public var tappedHandler: (() -> Void)?
    public var updatedHandler: (() -> Void)?
    
    // MARK: - Life Cycle
    
    public init() {}
    
    // MARK: - Internal Methods
    
    func updateCell() {
        updatedHandler?()
    }
    
}
