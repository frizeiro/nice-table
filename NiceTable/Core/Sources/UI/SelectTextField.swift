//
//  SelectTextField.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 28/02/25.
//

import Foundation

class SelectTextField: UITextField {
    
    
    // MARK: - Public Variables
    
    public var values: [SelectValue] = []
    public var valueChangedHandler: ((SelectValue?) -> Void)?
    
    public var selectedValue: SelectValue? {
        didSet {
            setupSelectedValue(selectedValue)
        }
    }

    // MARK: - Private Variables
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        return pickerView
    }()
    
    private lazy var doneButton = UIBarButtonItem(
        barButtonSystemItem: .done,
        target: self,
        action: #selector(done)
    )
    
    private lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: false)
        
        return toolbar
    }()
    
    // MARK: - Life Cycle
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        .zero
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        inputView = pickerView
        inputAccessoryView = toolbar
    }
    
    private func setupSelectedValue(_ value: SelectValue?) {
        guard let value,
              let row = values.firstIndex(where: { $0.id == value.id }),
              row != pickerView.selectedRow(inComponent: 1) else { return }
        
        pickerView.selectRow(row, inComponent: 1, animated: true)
    }
    
    @objc private func done() {
        resignFirstResponder()
    }
    
}

extension SelectTextField: UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    public func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        values.count
    }
    
}

extension SelectTextField: UIPickerViewDelegate {
    
    public func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        values[safe: row]?.text
    }
    
    public func pickerView(
        _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ) {
        if row == 0 {
            valueChangedHandler?(nil)
            text = nil
        } else {
            let value = values[safe: row]
            valueChangedHandler?(value)
            text = value?.text
        }
    }
    
}
