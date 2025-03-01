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
    
    override var size: NiceCollectionItemSize? {
        .dynamicFixed(itemsPerRow: 1, fixedHeight: 40)
    }
    
}
