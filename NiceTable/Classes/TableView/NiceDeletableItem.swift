//
//  NiceDeletableItem.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 12/10/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

protocol NiceDeletableItem {
    
    var deletedHandler: (() -> Void)? { get set }
    
}
