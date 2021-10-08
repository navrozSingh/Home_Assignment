//
//  UILabel+Extensions.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import UIKit

extension UILabel {
    
    /**
     - func createLabel is used to create an UIlabel
     - Parameter numberOfLines - used to specify the numberOfLines of the UIlabel
     - Parameter font - used to specify the font of the text field
     - Parameter color - used to specify the text color
     */
    class func createLabel(numberOfLines: Int = 1,
                           font: UIFont = UIFont.smallBold,
                           color: UIColor = UIColor.textColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = color
        label.font = font
        label.numberOfLines = numberOfLines
        return label
    }
}

