//
//  UICollectionView+ScrollTo.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 23/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    public func scrollToFirst(position: UICollectionView.ScrollPosition, animated: Bool) {
        scrollToItem(at: IndexPath(row: 0, section: 0), at: position, animated: animated)
    }
    
    public func scrollToFirst(animated: Bool = true) {
        if let flow = collectionViewLayout as? UICollectionViewFlowLayout {
            if flow.scrollDirection == .horizontal {
                scrollToLeft()
                return
            }
        }
        scrollToTop()
    }
    
    public func scrollToTop(animated: Bool = true) {
        scrollToFirst(position: .top, animated: animated)
    }
    
    public func scrollToLeft(animated: Bool = true) {
        scrollToFirst(position: .left, animated: animated)
    }
    
}
