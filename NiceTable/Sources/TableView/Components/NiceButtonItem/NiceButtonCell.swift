//
//  NiceButtonCell.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 02/10/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public class NiceButtonCell: NiceTableCell {
    
    // MARK: - Private Variables
    
    private var action: (() -> Void)?
    
    // MARK: - Outlets
    
    @IBOutlet private var button: UIButton?
    
    // MARK: - Public Methods
    
    public override func setup(_ item: NiceTableItem) {
        guard let item = item as? NiceButtonItem else { return }
        
        action = item.action
        button?.setTitle(item.text, for: .normal)
    }
    
    // MARK: - Private Methods
    
    @IBAction private func buttonTouchUpInside() {
        action?()
    }
    
}
