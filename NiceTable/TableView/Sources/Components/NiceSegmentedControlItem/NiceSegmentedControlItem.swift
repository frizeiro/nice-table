//
//  NiceSegmentedControlItem.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 23/03/25.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

open class NiceSegmentedControlItem: NiceTableItem {
    
    // MARK: - Public Variables
    
    public var label: String? {
        didSet { updateCell() }
    }
    
    public var text: String? {
        didSet { updateCell() }
    }
    
    public var options: [SegmentedOption]? {
        didSet { updateCell() }
    }
    
    public var footer: String? {
        didSet { updateCell() }
    }
    
    public var style: NiceContentStyle {
        didSet { updateCell() }
    }
    
    public var indexChangedHandler: ((_ index: Int, _ id: String?) -> Void)?
    
    public var selectedIndex: Int {
        didSet {
            if oldValue != selectedIndex {
                updateIndexHandler?()
            }
        }
    }
    
    // MARK: - Overriden Variables
    
    open override var cellType: NiceTableCell.Type {
        return NiceSegmentedControlCell.self
    }
    
    // MARK: - Internal Variables
    
    var notifyChanges: Bool = true
    var updateIndexHandler: (() -> Void)?
    
    // MARK: - Life Cycle
    
    public init(
        label: String? = nil,
        text: String? = nil,
        options: [SegmentedOption]? = nil,
        footer: String? = nil,
        selectedIndex: Int = -1,
        style: NiceContentStyle = .shared,
        indexChangedHandler: ((_ index: Int, _ id: String?) -> Void)? = nil
    ) {
        self.label = label
        self.text = text
        self.options = options
        self.footer = footer
        self.selectedIndex = selectedIndex
        self.style = style
        self.indexChangedHandler = indexChangedHandler
    }
    
    // MARK: - Internal Methods
    
    func notifyChanges(_ index: Int) {
        guard selectedIndex != index else { return }
        
        selectedIndex = index
        
        let option = options?[index].id
        indexChangedHandler?(index, option)
    }
    
}
