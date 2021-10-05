//
//  UILabel+Extensions.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import UIKit

extension UILabel {
    
    class func createLabel(textStyle: UIFont.TextStyle = .body , numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = numberOfLines
        label.font = UIFont.preferredFont(forTextStyle: textStyle)
        return label
    }
}

