//
//  UILabel+Extensions.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import UIKit

extension UILabel {
    
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

