//
//  UIViewFromNib.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 07/04/24.
//

import Foundation
import UIKit

open class UIViewWithNib: UIView {
    
    // MARK: - Private Variables
    
    // MARK: Outlets
    
    @IBOutlet private weak var contentView: UIView?
    
    // MARK: - Life Cycle
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Public Methods
    
    open func commonInit() {
        loadNibFromOwner()
        
        guard let contentView else {
            fatalError("\(className)'s contentView is nil. Please verify Outlet in your nib.")
        }
        
        contentView.frame = self.bounds
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
}

