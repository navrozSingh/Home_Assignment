//
//  UITextfield+Extensions.swift
//  Home_Assignment
//
//  Created by Navroz on 06/10/21.
//

import UIKit

extension UITextField {
    
    /**
     - func createTextField is used to create an textfield
     - Parameter backgroundColor - used to specify the backgroundColor of text field
     - Parameter placeholder - used to specify the placeholder text of the text field
     - Parameter leftSpace - used to specify the left padding text of the text field
     - Parameter cornerRadius - used to specify the cornerRadius of the text field
     */
    static func createTextField(backgroundColor: UIColor = .white,
                                placeholder: String,
                                leftSpace: CGFloat = 16.0,
                                cornerRadius: CGFloat = 8.0) -> UITextField {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
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
    
    var string: String { text ?? "" }
}

