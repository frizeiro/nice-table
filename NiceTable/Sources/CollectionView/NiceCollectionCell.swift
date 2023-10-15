//
//  NiceCollectionCell.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 22/03/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

open class NiceCollectionCell: UICollectionViewCell {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    public override var reuseIdentifier: String? {
        return Self.reuseIdentifier
    }
    
    open func setup(_ item: NiceCollectionItem) {
        fatalError("\(type(of: self)).setup() needs to be overwritten.")
    }
    
}

extension UICollectionView {
    
    public func register<T: NiceCollectionCell>(_ reusableCell: T.Type) {
        register(reusableCell.nNib, forCellWithReuseIdentifier: reusableCell.reuseIdentifier)
    }
    
    public func dequeue<T: NiceCollectionCell>(reusableCell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: reusableCell.reuseIdentifier, for: indexPath) as! T
    }
    
}
