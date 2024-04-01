//
//  NiceContentCell.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 25/04/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public class NiceContentCell: NiceTableCell {
    
    // MARK: - Private Variables
    
    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var label: UILabel?
    @IBOutlet private var subtitleLabel: UILabel?
    @IBOutlet private var textBodyLabel: UILabel?
    @IBOutlet private var footerLabel: UILabel?
    @IBOutlet private var primaryImageView: UIImageView?
    
    @IBOutlet private var masterStackView: UIStackView?
    @IBOutlet private var textFooterStackView: UIStackView?
    
    @IBOutlet private var primaryImageViewWidth: NSLayoutConstraint?
    @IBOutlet private var primaryImageViewHeight: NSLayoutConstraint?
    
    private var item: NiceContentItem? {
        return _item as? NiceContentItem
    }
    
    // MARK: - Public Methods
    
    public override func setup(_ item: NiceTableItem) {
        _item = item
    }
    
    public override func setupData() {
        guard let item else { return }
        
        setupAccessoryStyle(item)
        setupPresentation(item)
        setupLabels(item)
        setupPrimaryImageView(item)
        
        item.updatedHandler = { [weak self] in
            self?.setupData()
        }
    }
    
    // MARK: - Private Methods
    
    private func setupLabels(_ item: NiceContentItem) {
        titleLabel?.text = item.description.title
        titleLabel?.isHidden = item.description.title?.isEmpty ?? true
        titleLabel?.font = item.description.style.titleFont
        
        label?.text = item.description.label
        label?.isHidden = item.description.label?.isEmpty ?? true
        label?.font = item.description.style.labelFont
        
        subtitleLabel?.text = item.description.subtitle
        subtitleLabel?.isHidden = item.description.subtitle?.isEmpty ?? true
        subtitleLabel?.font = item.description.style.subtitleFont
        
        textBodyLabel?.text = item.description.text
        textBodyLabel?.isHidden = item.description.text?.isEmpty ?? true
        textBodyLabel?.font = item.description.style.textFont
        
        footerLabel?.text = item.description.footer
        footerLabel?.isHidden = item.description.footer?.isEmpty ?? true
        footerLabel?.font = item.description.style.footerFont
    }
    
    private func setupPresentation(_ item: NiceContentItem) {
        switch item.description.style.presentation {
            case .inline:
                masterStackView?.axis = .horizontal
                masterStackView?.alignment = .top
                masterStackView?.distribution = .fillProportionally
                textFooterStackView?.alignment = .trailing
                textBodyLabel?.textAlignment = .right
                footerLabel?.textAlignment = .right
            case .topDown:
                masterStackView?.axis = .vertical
                masterStackView?.alignment = .fill
                masterStackView?.distribution = .fill
                textFooterStackView?.alignment = .fill
                textBodyLabel?.textAlignment = .left
                footerLabel?.textAlignment = .left
        }
    }
    
    private func setupAccessoryStyle(_ item: NiceContentItem) {
        accessoryType = item.accessoryStyle.accessoryType
        accessoryView = item.accessoryStyle.accessoryView
    }
    
    private func setupPrimaryImageView(_ item: NiceContentItem) {
        primaryImageView?.image = item.description.image
        primaryImageView?.superview?.isHidden = item.description.image == nil
        
        primaryImageView?.nCornerRadius = item.description.style.iconCornerRadius
        primaryImageView?.nBorderColor = item.description.style.iconBorderColor
        primaryImageView?.nBorderWidth = item.description.style.iconBorderWidth
        primaryImageViewWidth?.constant = item.description.style.iconSize.width
        primaryImageViewHeight?.constant = item.description.style.iconSize.height
    }
    
}
