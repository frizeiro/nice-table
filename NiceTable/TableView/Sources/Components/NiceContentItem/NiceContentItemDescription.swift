//
//  NiceContentItemDescription.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 25/04/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public typealias Description = NiceContentItemDescription

public class NiceContentItemDescription: NiceContentItemRepresentable {
    
    // MARK: - Public Variables

    public var title: String?
    public var label: String?
    public var subtitle: String?
    public var text: String?
    public var footer: String?
    public var image: UIImage?
    public var style: NiceContentStyle
    
    // MARK: - Life Cycle
    
    public init(
        label: String? = nil,
        subtitle: String? = nil,
        text: String? = nil,
        image: UIImage? = nil,
        title: String? = nil,
        footer: String? = nil,
        style: NiceContentStyle = .shared
    ) {
        self.title = title
        self.label = label
        self.subtitle = subtitle
        self.text = text
        self.image = image
        self.footer = footer
        self.style = style
    }
    
}
