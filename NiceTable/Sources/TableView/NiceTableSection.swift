//
//  NiceTableSection.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 25/04/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

open class NiceTableSection {
    
    // MARK: - Public Variables
    
    public var items: [NiceTableItem]
    public var title: String?
    public var footer: String?
    
    // MARK: - Life Cycle
    
    public init(_ items: [NiceTableItem], title: String? = nil, footer: String? = nil) {
        self.items = items
        self.title = title
        self.footer = footer
    }
    
}
