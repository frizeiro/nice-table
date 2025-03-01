//
//  NiceSelectItem.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 23/03/25.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

open class NiceSelectItem: NiceTableItem {
    
    // MARK: - Public Variables
    
    public var label: String? {
        didSet { updateCell() }
    }
    
    public var values: [any SelectValue]? {
        didSet { updateCell() }
    }
    
    public var selectedValue: (any SelectValue)? {
        didSet {
            if oldValue?.id != selectedValue?.id {
                updateValueHandler?()
            }
        }
    }
    
    public var placeholder: String? {
        didSet { updateCell() }
    }
    
    public var footer: String? {
        didSet { updateCell() }
    }
    
    public var style: NiceContentStyle {
        didSet { updateCell() }
    }
    
    public var valueChanged: (((any SelectValue)?) -> Void)?
    
    // MARK: - Overriden Variables
    
    open override var cellType: NiceTableCell.Type {
        return NiceSelectCell.self
    }
    
    // MARK: - Internal Variables
    
    var notifyChanges: Bool = true
    var updateValueHandler: (() -> Void)?
    
    // MARK: - Life Cycle
    
    public init(
        label: String? = nil,
        values: [any SelectValue]? = nil,
        placeholder: String? = nil,
        footer: String? = nil,
        inputType: InputType = .default,
        style: NiceContentStyle = .shared,
        valueChanged: (((any SelectValue)?) -> Void)? = nil
    ) {
        self.label = label
        self.values = values
        self.placeholder = placeholder
        self.footer = footer
        self.style = style
        self.valueChanged = valueChanged
    }
    
    // MARK: - Internal Methods
    
    func notifyChanges(_ value: (any SelectValue)?) {
        guard notifyChanges else { return }
        
        valueChanged?(value)
    }
    
}
