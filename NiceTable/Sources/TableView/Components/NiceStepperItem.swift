//
//  NiceStepperItem.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 30/03/24.
//

import UIKit

public class NiceStepperItem: NiceContentItem {
    
    // MARK: - Public Variables
    
    public var valueChanged: ((Double) -> Void)?
    
    // MARK: - Internal Variables
    
    var value: Double
    var minValue: Double?
    var maxValue: Double?
    
    // MARK: - Private Variables
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        
        if let minValue {
            stepper.minimumValue = minValue
        }
        
        if let maxValue {
            stepper.maximumValue = maxValue
        }
        
        stepper.value = value
        stepper.addTarget(self, action: #selector(onValueChanged), for: .valueChanged)
        return stepper
    }()
    
    // MARK: - Life Cycle
    
    public init(
        _ description: NiceContentItemRepresentable,
        value: Double = 0,
        minValue: Double? = nil,
        maxValue: Double? = nil
    ) {
        self.value = value
        self.minValue = minValue
        self.maxValue = maxValue
        
        super.init(description, accessoryStyle: .none)
        self.accessoryStyle = .custom(stepper)
    }
    
    public init(
        _ description: NiceContentItemDescription,
        value: Double = 0,
        minValue: Double? = nil,
        maxValue: Double? = nil
    ) {
        self.value = value
        self.minValue = minValue
        self.maxValue = maxValue
        
        super.init(description, accessoryStyle: .none)
        self.accessoryStyle = .custom(stepper)
    }
    
    // MARK: - Private Methods
    
    @objc private func onValueChanged() {
        valueChanged?(stepper.value)
    }
    
}
