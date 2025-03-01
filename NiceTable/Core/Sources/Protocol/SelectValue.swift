//
//  SelectValue.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 28/02/25.
//

import Foundation

public protocol SelectValue {
    
    var id: String { get }
    var text: String { get }
    var value: Any { get }
    
}

extension SelectValue {
    
    public var id: String {
        text
    }
    
    public var value: Any {
        text
    }
    
}

extension String: SelectValue {
    
    public var text: String {
        self
    }
    
}
