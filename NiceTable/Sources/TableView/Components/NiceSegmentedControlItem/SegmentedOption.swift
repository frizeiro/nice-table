//
//  SegmentedOption.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 25/02/25.
//

import Foundation

public enum SegmentedOption {
    
    case title(id: String, title: String)
    case image(id: String, image: UIImage)

}

extension SegmentedOption {
    
    public var id: String {
        switch self {
            case .title(let id, _), .image(let id, _):
                id
        }
    }
    
}
