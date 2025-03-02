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
        
    private let flexSpace = UIBarButtonItem(
        barButtonSystemItem: .flexibleSpace,
        target: nil,
        action: nil
    )

    
    private lazy var doneButton = UIBarButtonItem(
        barButtonSystemItem: .done,
        target: self,
        action: #selector(done)
    )
    
    private lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([flexSpace, doneButton], animated: false)
        
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
    
    // MARK: - Internal Methods
    
    func removeIconMargin() {
        rightView = dropDownIcon(marginRight: 0)
    }
    
    func restoreIconMargin() {
        rightView = dropDownIcon()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        inputView = pickerView
        inputAccessoryView = toolbar
        
        rightView = dropDownIcon()
        rightViewMode = .always
    }
    
    private func setupSelectedValue(_ value: SelectValue?) {
        guard let value else {
            select(row: 0)
            return
        }
        
        guard let row = values.firstIndex(where: { $0.id == value.id }),
              row != selectedRow() else { return }
        
        select(row: row)
    }
    
    private func dropDownIcon(marginRight: CGFloat = 7) -> UIView {
        let icon = UIImageView(image: .chevronUpDown)
        icon.tintColor = .lightGray
        icon.frame = CGRect(x: 7, y: 7, width: 16, height: 16)
        icon.contentMode = .scaleAspectFit
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(rightViewTapped))
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 23 + marginRight, height: 30))
        container.addSubview(icon)
        container.isUserInteractionEnabled = true
        container.addGestureRecognizer(tapGesture)
        
        return container
    }
    
    @objc private func done() {
        resignFirstResponder()
    }
    
    @objc private func rightViewTapped() {
        becomeFirstResponder()
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
    
    private func select(row: Int) {
        pickerView.selectRow(row, inComponent: 0, animated: true)
    }
    
    private func selectedRow() -> Int {
        pickerView.selectedRow(inComponent: 0)
    }
    
}
