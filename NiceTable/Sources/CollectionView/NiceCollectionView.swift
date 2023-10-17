//
//  NiceCollectionView.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 22/03/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation
import UIKit

open class NiceCollectionView: UICollectionView {
    
    // MARK: - Public Variables
    
    public var sections: [NiceCollectionSection] = [] {
        didSet {
            reloadData()
        }
    }
    
    public var itemsSize: NiceCollectionItemSize = .square(itemsPerRow: 3) {
        didSet {
            updateSizeForItem()
        }
    }
    
    public var itemSpacing: CGFloat = 10 {
        didSet {
            updateSizeForItem()
        }
    }
    
    public var loadMoreEnabled: Bool = false {
        didSet {
//            updateLoadMore()
        }
    }
    
    public var loadMoreHandler: (() -> Void)? = nil
    
    public lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInsetReference = .fromSafeArea
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }()
    
    // MARK: - Overriden Variables
    
    open override var frame: CGRect {
        didSet {
            DispatchQueue.main.async {
                self.updateSizeForItem()
            }
        }
    }
    
    // MARK: - Private Variables
    
    private var registeredCells: [String] = []
    
    private var sizeForItem: CGSize = .zero {
        didSet {
            if oldValue != .zero, oldValue != sizeForItem {
                collectionViewLayout.invalidateLayout()
            }
        }
    }
        
    private lazy var loadMoreSection: NiceCollectionSection = {
        let item = NiceCollectionLoadMoreItem()
        
        var style = NiceSectionStyle.shared
        style.isHeaderHidden = true
        
        return NiceCollectionSection([item], style: style)
    }()
    
    private var _sections: [NiceCollectionSection] {
        if loadMoreEnabled, !sections.isEmpty {
            return sections + [loadMoreSection]
        } else {
            return sections
        }
    }
    
    // MARK: - Life Cycle
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Overriden Methods
    
    open override func reloadData() {
        registerCells()
        super.reloadData()
    }
    
    // MARK: - Private Methods
    
    private func commonInit() {
        dataSource = self
        delegate = self
        
        register(NiceCollectionHeaderView.nNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NiceCollectionHeaderView.nNibName)
        
        setupUI()
    }
    
    private func registerCells() {
        let items = _sections.flatMap { $0.items }
        var new = items.filter { !registeredCells.contains($0.cellType.reuseIdentifier) }
        
        while !new.isEmpty {
            let item = new.first!
            register(item.cellType)
            registeredCells.append(item.cellType.reuseIdentifier)
            new.removeAll { $0.cellType == item.cellType }
        }
    }
    
    private func setupUI() {
        collectionViewLayout = flowLayout
        updateSizeForItem()
    }
    
    private func updateSizeForItem() {
        sizeForItem = itemsSize.size(for: self)
    }
    
    private func item(for indexPath: IndexPath) -> NiceCollectionItem {
        return _sections[indexPath.section].items[indexPath.row]
    }
    
    private func visualEffect(for indexPath: IndexPath) {
        guard let cell = cellForItem(at: indexPath) else { return }
            
        let alphaOrigin = cell.contentView.alpha
        let alpha = cell.contentView.alpha - 0.30
        
        cell.contentView.alpha = alpha
        
        UIView.animate(withDuration: 0.26) {
            cell.contentView.alpha = alphaOrigin
        }
    }
    
}

extension NiceCollectionView: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return _sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _sections[section].items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = item(for: indexPath)
        let cell = collectionView.dequeue(reusableCell: item.cellType, for: indexPath)
        cell.setup(item)
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NiceCollectionHeaderView.nNibName, for: indexPath) as! NiceCollectionHeaderView

            headerView.setup(_sections[indexPath.section])
            
            return headerView

        case UICollectionView.elementKindSectionFooter:
            return UICollectionReusableView(frame: .zero)
            
        default:
            return UICollectionReusableView(frame: .zero)
            
        }
            
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard loadMoreEnabled else { return }
        
        let item = item(for: indexPath)
        
        if item is NiceCollectionLoadMoreItem {
            loadMoreHandler?()
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let style = _sections[section].style
        let height = CGSize(width: collectionView.frame.width, height: style.headerHeight)
        return style.isHeaderHidden ? .zero : height
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let style = _sections[section].style
        let height = CGSize(width: collectionView.frame.width, height: style.footerHeight)
        return style.isFooterHidden ? .zero : height
    }
    
}

extension NiceCollectionView: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        visualEffect(for: indexPath)
        item(for: indexPath).tappedHandler?()
    }
    
}

extension NiceCollectionView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let itemSize = item(for: indexPath).size {
            return itemSize.size(for: self)
        }
        
        return sizeForItem
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: itemSpacing, left: itemSpacing, bottom: itemSpacing, right: itemSpacing)
    }
    
}
