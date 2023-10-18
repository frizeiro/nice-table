//
//  NiceSwitchItem.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 21/05/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

public class NiceSwitchItem: NiceContentItem {
    
    // MARK: - Public Variables
    
    public var switchValueChanged: ((Bool) -> Void)?
    
    // MARK: - Internal Variables
    
    var value: Bool
    
    // MARK: - Private Variables
    
    private lazy var switchView: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = value
        switchView.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        return switchView
    }()
    
    // MARK: - Life Cycle
    
    public init(
        _ description: NiceContentItemRepresentable,
        value: Bool = false
    ) {
        self.value = value
        super.init(description, accessoryStyle: .none)
        self.accessoryStyle = .custom(switchView)
    }
    
    public init(
        _ description: NiceContentItemDescription,
        value: Bool = false
    ) {
        self.value = value
        super.init(description, accessoryStyle: .none)
        self.accessoryStyle = .custom(switchView)
    }
    
    // MARK: - Private Methods
    
    @objc private func valueChanged() {
        switchValueChanged?(switchView.isOn)
    }
    
}
