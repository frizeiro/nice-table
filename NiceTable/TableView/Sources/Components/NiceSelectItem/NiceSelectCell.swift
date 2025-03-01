//
//  NiceSelectCell.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 23/03/25.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public class NiceSelectCell: NiceTableCell {
    
    // MARK: - Private Variables
    
    private var action: (() -> Void)?
    
    private var item: NiceSelectItem? {
        _item as? NiceSelectItem
    }
        
    // MARK: - Outlets
    
    @IBOutlet private var label: UILabel?
    @IBOutlet private var selectTextField: SelectTextField?
    @IBOutlet private var footerLabel: UILabel?
        
    // MARK: - Public Methods
    
    public override func setup(_ item: NiceTableItem) {
        _item = item
    }
    
    public override func setupData() {
        guard let item else { return }
        
        setupLabels(item)
        setupValue(item)
        
        item.updatedHandler = { [weak self] in
            self?.setupData()
        }
    }
    
    // MARK: - Private Methods
    
    private func setupLabels(_ item: NiceSelectItem) {
        label?.text = item.label
        label?.isHidden = item.label?.isEmpty ?? true
        label?.font = item.style.labelFont
        
        footerLabel?.text = item.footer
        footerLabel?.isHidden = item.footer?.isEmpty ?? true
        footerLabel?.font = item.style.footerFont
    }
    
    private func setupValue(_ item: NiceSelectItem) {
        selectTextField?.placeholder = item.placeholder
        selectTextField?.text = item.selectedValue?.text
        
        selectTextField?.values = [item.placeholder ?? ""] + (item.values ?? [])
        selectTextField?.selectedValue = item.selectedValue
    }
    
}
