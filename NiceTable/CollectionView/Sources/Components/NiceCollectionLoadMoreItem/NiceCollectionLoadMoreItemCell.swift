//
//  NiceCollectionLoadMoreItemCell.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 17/10/23.
//

import Foundation

class NiceCollectionLoadMoreItemCell: NiceCollectionCell {
    
    // MARK: - Private Variables
    
    @IBOutlet private var indicatorView: UIActivityIndicatorView?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        indicatorView?.startAnimating()
    }
    
    // MARK: - Public Methods
    
    override func setup(_ item: NiceCollectionItem) {
        indicatorView?.startAnimating()
    }
    
}
