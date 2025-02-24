//
//  NiceInputTextCell.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 23/03/25.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public class NiceInputTextCell: NiceTableCell {
    
    // MARK: - Private Variables
    
    private var action: (() -> Void)?
    
    // MARK: - Outlets
    
    @IBOutlet private var label: UILabel?
    @IBOutlet private var textField: UITextField?
    @IBOutlet private var footerLabel: UILabel?
    
    private var item: NiceInputTextItem? {
        return _item as? NiceInputTextItem
    }
    
    // MARK: - Life Cycle
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        textField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    // MARK: - Public Methods
    
    public override func setup(_ item: NiceTableItem) {
        _item = item
    }
    
    public override func setupData() {
        guard let item else { return }
        
        setupLabels(item)
        setupText(item)
        
        item.updatedHandler = { [weak self] in
            self?.setupData()
        }
    }
    
    // MARK: - Private Methods
    
    private func setupLabels(_ item: NiceInputTextItem) {
        label?.text = item.label
        label?.isHidden = item.label?.isEmpty ?? true
        label?.font = item.style.labelFont
        
        footerLabel?.text = item.footer
        footerLabel?.isHidden = item.footer?.isEmpty ?? true
        footerLabel?.font = item.style.footerFont
    }
    
    private func setupText(_ item: NiceInputTextItem) {
        textField?.text = item.text
        textField?.placeholder = item.placeholder
    }
    
    // MARK: - Private Methods
    
    @IBAction private func buttonTouchUpInside() {
        action?()
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        item?.valueChanged?(textField.text ?? "")
    }
    
}
