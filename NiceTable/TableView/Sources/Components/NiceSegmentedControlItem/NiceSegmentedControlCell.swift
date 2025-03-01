//
//  NiceSegmentedControlCell.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 23/03/25.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public class NiceSegmentedControlCell: NiceTableCell {
    
    // MARK: - Private Variables
    
    private var action: (() -> Void)?
    
    private var item: NiceSegmentedControlItem? {
        _item as? NiceSegmentedControlItem
    }
    
    // MARK: - Outlets
    
    @IBOutlet private var label: UILabel?
    @IBOutlet private var segmentedControl: UISegmentedControl?
    @IBOutlet private var footerLabel: UILabel?
    
    // MARK: - Life Cycle
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        segmentedControl?.addTarget(self, action: #selector(optionDidChange(_:)), for: .valueChanged)
    }
    
    // MARK: - Public Methods
    
    public override func setup(_ item: NiceTableItem) {
        _item = item
    }
    
    public override func setupData() {
        guard let item else { return }
        
        setupLabels(item)
        setupItems(item)
        
        item.updatedHandler = { [weak self] in
            self?.setupData()
        }
        
        item.updateIndexHandler = { [weak self] in
            self?.segmentedControl?.selectedSegmentIndex = item.selectedIndex
        }
    }
    
    // MARK: - Private Methods
    
    private func setupLabels(_ item: NiceSegmentedControlItem) {
        label?.text = item.label
        label?.isHidden = item.label?.isEmpty ?? true
        label?.font = item.style.labelFont
        
        footerLabel?.text = item.footer
        footerLabel?.isHidden = item.footer?.isEmpty ?? true
        footerLabel?.font = item.style.footerFont
    }
    
    private func setupItems(_ item: NiceSegmentedControlItem) {
        segmentedControl?.removeAllSegments()
        
        item.options?.enumerated().forEach { index, option in
            switch option {
                case .title(_, let title):
                    segmentedControl?.insertSegment(withTitle: title, at: index, animated: false)
                case .image(_, let image):
                    segmentedControl?.insertSegment(with: image, at: index, animated: false)
            }
        }
        
        segmentedControl?.selectedSegmentIndex = item.selectedIndex
    }
        
    // MARK: - Private Methods
    
    @objc private func optionDidChange(_ segmentedControl: UISegmentedControl) {
        item?.notifyChanges(segmentedControl.selectedSegmentIndex)
    }
    
}
