//
//  NiceTableCell.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 25/04/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

import UIKit

open class NiceTableCell: UITableViewCell {
    
    // MARK: - Public Variables
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    public override var reuseIdentifier: String? {
        return Self.reuseIdentifier
    }
    
    // MARK: - Internal Variables
    
    var _item: NiceTableItem? {
        didSet {
            setupData()
        }
    }
    
    // MARK: - Public Methods
    
    open func setup(_ item: NiceTableItem) {
        fatalError("\(type(of: self)).setup() needs to be overwritten.")
    }
    
    open func setupData() {}
    
}

extension UITableView {
    
    public func register<T: NiceTableCell>(_ reusableCell: T.Type) {
        register(reusableCell.nNib, forCellReuseIdentifier: reusableCell.reuseIdentifier)
    }
    
    public func dequeue<T: NiceTableCell>(reusableCell: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: reusableCell.reuseIdentifier, for: indexPath) as! T
    }
    
}
