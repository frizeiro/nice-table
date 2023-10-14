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
    
    // MARK: - Public Methods
    
    public override func setup(_ item: NiceTableItem) {
        guard let item = item as? NiceContentItem else { return }
        
        setupAccessoryStyle(item)
        setupPresentation(item)
                
        titleLabel?.text = item.description.title
        titleLabel?.isHidden = item.description.title?.isEmpty ?? true
        
        label?.text = item.description.label
        label?.isHidden = item.description.label?.isEmpty ?? true
        
        subtitleLabel?.text = item.description.subtitle
        subtitleLabel?.isHidden = item.description.subtitle?.isEmpty ?? true
        
        textBodyLabel?.text = item.description.text
        textBodyLabel?.isHidden = item.description.text?.isEmpty ?? true
        
        footerLabel?.text = item.description.footer
        footerLabel?.isHidden = item.description.footer?.isEmpty ?? true
        
        setupPrimaryImageView(item)
    }
    
    // MARK: - Private Methods
    
    private func setupPresentation(_ item: NiceContentItem) {
        
        switch item.description.style.presentation {
        case .inline:
            masterStackView?.axis = .horizontal
            masterStackView?.alignment = .top
            masterStackView?.distribution = .fillEqually
            textFooterStackView?.alignment = .trailing
        case .topDown:
            masterStackView?.axis = .vertical
            masterStackView?.alignment = .fill
            masterStackView?.distribution = .fill
            textFooterStackView?.alignment = .fill
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
