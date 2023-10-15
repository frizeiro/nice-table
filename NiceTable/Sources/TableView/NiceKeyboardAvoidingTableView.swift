//
//  NiceKeyboardAvoidingTableView.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 18/07/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

open class NiceKeyboardAvoidingTableView: UITableView {
    
    // MARK: - Public Variables
    
    open override var contentInset: UIEdgeInsets {
        get {
            return super.contentInset
        }
        set {
            bottomContentInset = newValue.bottom
            super.contentInset = newValue
        }
    }
    
    open override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        if newSuperview != nil {
            setupKeyboardObserver()
        } else {
            removeKeyboardObserver()
        }
    }
    
    // MARK: - Private Variables
    
    private var bottomContentInset: CGFloat = 0
    
    // MARK: - Private Methods
    
    private func setupKeyboardObserver() {
        bottomContentInset = contentInset.bottom
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        guard let size = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        super.contentInset = contentInset.with(bottom: size.height)
    }

    @objc private func keyboardWillHide(_ notification: NSNotification) {
        super.contentInset = contentInset.with(bottom: bottomContentInset)
    }
    
}

private extension UIEdgeInsets {
    
    func with(bottom newBottom: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: newBottom, right: right)
    }
    
}
