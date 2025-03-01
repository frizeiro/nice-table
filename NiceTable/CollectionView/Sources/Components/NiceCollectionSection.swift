//
//  NiceCollectionSection.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 22/03/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation
import UIKit

open class NiceCollectionSection {
    
    // MARK: - Public Variables
    
    public let items: [NiceCollectionItem]
    public let title: String?
    public let style: NiceSectionStyle
    
    // MARK: - Life Cycle
    
    public init(
        _ items: [NiceCollectionItem],
        title: String? = nil,
        style: NiceSectionStyle = .shared
    ) {
        self.items = items
        self.title = title
        self.style = style
    }
    
}
