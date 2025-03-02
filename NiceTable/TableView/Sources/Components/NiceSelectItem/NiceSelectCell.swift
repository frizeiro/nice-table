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
    
    @IBOutlet private var inputHeightConstraint: NSLayoutConstraint?
    @IBOutlet private var inputStackView: UIStackView?
    
    // MARK: - Life Cycle
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        selectTextField?.valueChangedHandler = { [weak self] selected in
            self?.item?.notifyChanges(selected)
        }
    }
        
    // MARK: - Public Methods
    
    public override func setup(_ item: NiceTableItem) {
        _item = item
    }
    
    public override func setupData() {
        guard let item else { return }
        
        setupLabels(item)
        setupValue(item)
        setupPresentation(item)
        
        item.updatedHandler = { [weak self] in
            self?.setupData()
        }
        
        item.updateValueHandler = { [weak self] in
            self?.setupValue(item)
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
        
        selectTextField?.values = [""] + (item.values ?? [])
        selectTextField?.selectedValue = item.selectedValue
    }
    
    private func setupPresentation(_ item: NiceSelectItem) {
        switch item.style.presentation {
            case .inline:
                selectTextField?.borderStyle = .none
                selectTextField?.textAlignment = .right
                selectTextField?.removeIconMargin()
                inputStackView?.axis = .horizontal
                inputHeightConstraint?.constant = 0
            case .topDown:
                selectTextField?.borderStyle = .roundedRect
                selectTextField?.textAlignment = .left
                selectTextField?.restoreIconMargin()
                inputStackView?.axis = .vertical
                inputHeightConstraint?.constant = 44
        }
    }
    
}
