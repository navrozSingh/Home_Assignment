//
//  UITextfield+Extensions.swift
//  Home_Assignment
//
//  Created by Navroz on 06/10/21.
//

import UIKit

extension UITextField {
    
    static func createTextField(backgroundColor: UIColor = .white,
                                placeholder: String,
                                leftSpace: CGFloat = 20,
                                cornerRadius: CGFloat = 8) -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = backgroundColor
        textField.placeholder = placeholder
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0,
                                                   width: leftSpace,
                                                   height: textField.frame.height))
        textField.layer.cornerRadius = cornerRadius
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        return textField
    }
    
    func addButton() {
        guard
            rightView == textFieldBtn else {
            rightView = textFieldBtn
            return
        }
    }
    
    func removeButton() {
        textFieldBtn.removeFromSuperview()
    }
    
    
    private var textFieldBtn: UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "xmark.bin.circle.fill"), for: .normal)
        button.imageEdgeInsets = .zero
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        return button
    }

    var string: String { text ?? "" }
}

