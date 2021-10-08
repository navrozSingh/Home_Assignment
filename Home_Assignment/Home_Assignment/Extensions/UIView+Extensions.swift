//
//  UIView+Extensions.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import UIKit

extension UIView {
    /**
     - func addShow is used to add shadow to any uiview
     - Parameters color - specify the shadow color
     - Parameters radius - specify the radius of the shadow
     - Parameters offset - specify the offset of the shadow
     - Parameters opacity - specify the opacity of the shadow
     */

    func addShadow(
        ofColor color: UIColor = .darkGray,
        radius: CGFloat = 3,
        offset: CGSize = .zero,
        opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}
