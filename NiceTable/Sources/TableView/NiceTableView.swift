//
//  NiceTableView.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 25/04/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation
import UIKit

open class NiceTableView: NiceKeyboardAvoidingTableView {
    
    // MARK: - Public Variables
    
    public var sections: [NiceTableSection] = [] {
        didSet {
            registerCells()
            reloadData()
        }
    }
    
    // MARK: - Private Variables
    
    private var registeredCells: [String] = []
    
    // MARK: - Life Cycle
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Private Methods
    
    private func commonInit() {
        dataSource = self
        delegate = self
        
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = .invisible
        }
    }
    
    // MARK: - Public Methods
    
    public func deselectRows(animated: Bool = true) {
        guard let indexPaths = indexPathsForSelectedRows else { return }
        indexPaths.forEach { deselectRow(at: $0, animated: animated) }
    }
    
    // MARK: - Private Methods
    
    private func registerCells() {
        let items = sections.flatMap { $0.items }
        var new = items.filter { !registeredCells.contains($0.cellType.reuseIdentifier) }
        
        while !new.isEmpty {
            let item = new.first!
            register(item.cellType)
            registeredCells.append(item.cellType.reuseIdentifier)
            new.removeAll { $0.cellType == item.cellType }
        }
    }
    
    private func item(for indexPath: IndexPath) -> NiceTableItem {
        return sections[indexPath.section].items[indexPath.row]
    }
    
    private func deletableItem(for indexPath: IndexPath) -> NiceDeletableItem? {
        return item(for: indexPath) as? NiceDeletableItem
    }
    
    private func isLast(_ indexPath: IndexPath) -> Bool {
        return indexPath.section == sections.count - 1 && indexPath.row == sections[indexPath.section].items.count - 1
    }
    
    private func style(for section: Int) -> NiceSectionStyle {
        return sections[section].style
    }
}

extension NiceTableView: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeue(reusableCell: item.cellType, for: indexPath)
        cell.setup(item)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let style = style(for: section)
        return style.isHeaderHidden ? nil : sections[section].title
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let style = style(for: section)
        return style.isFooterHidden ? nil : sections[section].footer
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let style = style(for: section)
        return style.isHeaderHidden ? .invisible : style.headerHeight
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let style = style(for: section)
        return style.isFooterHidden ? .invisible : style.footerHeight
    }
    
}

extension NiceTableView: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return item(for: indexPath).tappedHandler != nil ? indexPath : nil
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        item(for: indexPath).tappedHandler?()
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return item(for: indexPath).tappedHandler != nil
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return deletableItem(for: indexPath)?.deletedHandler != nil
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if let handler = deletableItem(for: indexPath)?.deletedHandler, editingStyle == .delete {
            
            if sections[indexPath.section].items.count == 1 {
                beginUpdates()
                sections.remove(at: indexPath.section)
                tableView.deleteSections([indexPath.section], with: .fade)
                endUpdates()
            } else {
                sections[indexPath.section].items.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            handler()
            
        }
    }
    
}
