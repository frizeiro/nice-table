//
//  Array+Support.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 28/02/25.
//

import Foundation

extension Array {

    // MARK: - Public Methods
    
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
    
}
