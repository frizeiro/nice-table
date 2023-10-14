//
//  NiceButtonItem.swift
//  Biblia
//
//  Created by Felipe Frizeiro on 02/10/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

open class NiceButtonItem: NiceTableItem {
    
    // MARK: - Internal Variables
    
    var text: String
    var action: (() -> Void)
    
    // MARK: - Overriden Variables
    
    open override var cellType: NiceTableCell.Type {
        return NiceButtonCell.self
    }
    
    // MARK: - Life Cycle
    
    public init(_ text: String, action: @escaping (() -> Void)) {
        self.text = text
        self.action = action
    }
    
}
