//
//  NiceCollectionItemSize.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 15/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public enum NiceCollectionItemSize {
    
    case fixed(_ size: CGSize)
    case square(itemsPerRow: Int)
    case dynamicFixed(itemsPerRow: Int, fixedHeight: CGFloat)
    case dynamicProportional(itemsPerRow: Int, proportionalHeight: CGFloat)
    case estimatedFixed(width: CGFloat, fixedHeight: CGFloat)
    case estimatedProportional(width: CGFloat, proportionalHeight: CGFloat)
    
}

extension NiceCollectionItemSize {
    
    var description: String {
        switch self {
            
        case .fixed(let size):
            return "fixed:\(size.width),\(size.height)"
            
        case .square(let itemsPerRow):
            return "square:\(itemsPerRow)"
            
        case .dynamicFixed(let itemsPerRow, let fixedHeight):
            return "dynamicFixed:\(itemsPerRow),\(fixedHeight)"
            
        case .dynamicProportional(let itemsPerRow, let proportionalHeight):
            return "dynamicProportional:\(itemsPerRow),\(proportionalHeight)"
            
        case .estimatedFixed(width: let width, fixedHeight: let fixedHeight):
            return "estimatedFixed:\(width),\(fixedHeight)"
            
        case .estimatedProportional(width: let width, proportionalHeight: let proportionalHeight):
            return "estimatedProportional:\(width),\(proportionalHeight)"
        }
    }
    
}

extension NiceCollectionItemSize {
    
    func size(for collection: NiceCollectionView) -> CGSize {
        switch self {
        case .fixed(let size):
            return size
            
        case .square(let itemsPerRow):
            let width = self.width(by: itemsPerRow, for: collection)
            return CGSize(width: width, height: width)
            
        case .dynamicFixed(let itemsPerRow, let fixedHeight):
            let width = self.width(by: itemsPerRow, for: collection)
            return CGSize(width: width, height: fixedHeight)
            
        case .dynamicProportional(let itemsPerRow, let proportionalHeight):
            let width = self.width(by: itemsPerRow, for: collection)
            return CGSize(width: width, height: width * proportionalHeight)
            
        case .estimatedFixed(width: let width, fixedHeight: let fixedHeight):
            let width = self.width(itemWidth: width, for: collection)
            return CGSize(width: width, height: fixedHeight)
            
        case .estimatedProportional(width: let width, proportionalHeight: let proportionalHeight):
            let width = self.width(itemWidth: width, for: collection)
            return CGSize(width: width, height: width * proportionalHeight)
            
        }
    }
    
    private func width(by itemsPerRow: Int, for collection: NiceCollectionView) -> CGFloat {
        let items = CGFloat(itemsPerRow)
        var availableWidth = freeWidth(in: collection)
        availableWidth = availableWidth - (CGFloat(itemsPerRow-1)*collection.itemSpacing)
        let width = (availableWidth / items).rounded(.down)
        return width
    }
    
    private func width(itemWidth: CGFloat, for collection: NiceCollectionView) -> CGFloat {
        let estimetedItemWidth = itemWidth
        let freeWidth = self.freeWidth(in: collection)
        let items = (freeWidth / estimetedItemWidth).rounded()
        
        return width(by: Int(items), for: collection)
    }
    
    private func freeWidth(in collection: NiceCollectionView) -> CGFloat {
        let safeArea = collection.safeAreaInsets.left + collection.safeAreaInsets.right
        return collection.frame.width - (2*collection.itemSpacing) - safeArea
    }
    
}
