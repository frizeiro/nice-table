//
//  NiceCollectionItem.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 22/03/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

open class NiceCollectionItem {
    
    // MARK: - Public Variables
    
    open var cellType: NiceCollectionCell.Type {
        fatalError("\(type(of: self)).cellType needs to be overwritten.")
    }
    
    open var size: NiceCollectionItemSize? {
        return nil
    }
    
    public var tappedHandler: (() -> Void)?
    
    // MARK: - Life Cycle
    
    public init() {}
    
}
