//
//  InputType.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 24/02/25.
//

import Foundation

public enum InputType {
    case `default`
    case integer
    case decimal
}

extension InputType {
    
    // MARK: - Public Methods
    
    public var keyboardType: UIKeyboardType {
        switch self {
            case .`default`:
                    .default
            case .integer:
                    .numberPad
            case .decimal:
                    .decimalPad
        }
    }
    
    // MARK: - Internal Methods
    
    func shouldChangeCharacters(_ textField: UITextField, replacementString string: String) -> Bool {
        switch self {
            case .default:
                true
            case .integer:
                integer(textField, replacementString: string)
            case .decimal:
                decimal(textField, replacementString: string)
        }
    }
    
    // MARK: - Private Methods
    
    private func integer(_ textField: UITextField, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    private func decimal(_ textField: UITextField, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits.union(CharacterSet(charactersIn: ",."))
        let characterSet = CharacterSet(charactersIn: string)
        
        if !allowedCharacters.isSuperset(of: characterSet) {
            return false
        }
        
        let existingText = textField.text ?? ""
        if (string == "," || string == ".") && (existingText.contains(",") || existingText.contains(".")) {
            return false
        }
        
        return true
    }
    
}
