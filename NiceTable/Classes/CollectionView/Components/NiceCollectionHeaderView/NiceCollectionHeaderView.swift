//
//  NiceCollectionHeaderView.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 22/03/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation
import UIKit

open class NiceCollectionHeaderView: UICollectionReusableView {
    
    // MARK: - Private Variables
    
    @IBOutlet private var titleLabel: UILabel?
    
    // MARK: - Public Methods
    
    public func setup(_ section: NiceCollectionSection) {
        titleLabel?.text = section.title
    }
    
}
