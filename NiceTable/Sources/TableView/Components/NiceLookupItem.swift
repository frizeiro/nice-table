//
//  NiceLookupItem.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 21/05/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

public class NiceLookupItem: NiceContentItem {
    
    // MARK: - Life Cycle
    
    public override init(
        _ description: NiceContentItemRepresentable,
        accessoryStyle: NiceContentAccessoryStyle = .lookup
    ) {
        super.init(description, accessoryStyle: accessoryStyle)
    }
    
    public override init(
        _ description: NiceContentItemDescription,
        accessoryStyle: NiceContentAccessoryStyle = .lookup
    ) {
        super.init(description, accessoryStyle: accessoryStyle)
    }
    
}
