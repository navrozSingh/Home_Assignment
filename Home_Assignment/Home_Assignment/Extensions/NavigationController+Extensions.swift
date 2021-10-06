//
//  NavigationController+Extensions.swift
//  Home_Assignment
//
//  Created by Navroz on 06/10/21.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func addCustomColorToNavigationBar(color: UIColor) {
        self.navigationBar.barTintColor = color
    }
    
    func leftAlignedTitle(title: String, frontPadding: CGFloat = 16) -> UIView {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        let frontSpacer = UIView()
        let spacer = UIView()
        let constraint = spacer.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width)
        constraint.isActive = true
        constraint.priority = .defaultLow
        frontSpacer.widthAnchor.constraint(equalToConstant: frontPadding).isActive = true
        let stack = UIStackView(arrangedSubviews: [frontSpacer,titleLabel, spacer])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }
}