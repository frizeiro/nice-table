//
//  NiceInputTextItem.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 23/03/25.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

open class NiceInputTextItem: NiceTableItem {
    
    // MARK: - Public Variables
    
    public var label: String? {
        didSet { updateCell() }
    }
    
    public var text: String? {
        didSet { updateCell() }
    }
    
    public var placeholder: String? {
        didSet { updateCell() }
    }
    
    public var footer: String? {
        didSet { updateCell() }
    }
    
    public var inputType: InputType {
        didSet { updateCell() }
    }
    
    public var style: NiceContentStyle {
        didSet { updateCell() }
    }
    
    public var valueChanged: ((String) -> Void)?
    
    // MARK: - Overriden Variables
    
    open override var cellType: NiceTableCell.Type {
        return NiceInputTextCell.self
    }
    
    // MARK: - Internal Variables
    
    var notifyChanges: Bool = true
    
    // MARK: - Life Cycle
    
    public init(
        label: String? = nil,
        text: String? = nil,
        placeholder: String? = nil,
        footer: String? = nil,
        inputType: InputType = .default,
        style: NiceContentStyle = .shared,
        valueChanged: ((String) -> Void)? = nil
    ) {
        self.label = label
        self.text = text
        self.placeholder = placeholder
        self.footer = footer
        self.inputType = inputType
        self.style = style
        self.valueChanged = valueChanged
    }
    
    // MARK: - Public Methods
    
    public func setTextWithoutNotify(_ text: String?) {
        notifyChanges = false
        self.text = text
        updateCell()
        notifyChanges = true
    }
    
}
