//
//  NiceCollectionLoadMoreItem.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 17/10/23.
//

import Foundation

class NiceCollectionLoadMoreItem: NiceCollectionItem {
    
    // MARK: - Public Variables
    
    override var cellType: NiceCollectionCell.Type {
        return NiceCollectionLoadMoreItemCell.self
    }
    
    // MARK: - Life Cycle
        
    override init() {
        super.init()
        
        size = .dynamicFixed(itemsPerRow: 1, fixedHeight: 40)
    }
    
}
