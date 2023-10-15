//
//  NiceContentItemRepresentable.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 25/04/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public protocol NiceContentItemRepresentable {
    
    var title: String? { get }
    var label: String? { get }
    var subtitle: String? { get }
    var text: String? { get }
    var footer: String? { get }
    var image: UIImage? { get }
    
    var style: NiceContentStyle { get }
    
}

extension NiceContentItemRepresentable {
    
    public var title: String? {
        return nil
    }
    
    public var subtitle: String? {
        return nil
    }
    
    public var text: String? {
        return nil
    }
    
    public var footer: String? {
        return nil
    }
    
    public var image: UIImage? {
        return nil
    }
    
    public var style: NiceContentStyle {
        return .shared
    }
    
}
