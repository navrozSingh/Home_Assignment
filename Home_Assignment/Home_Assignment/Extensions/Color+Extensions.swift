//
//  Color+Extensions.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import UIKit

extension UIColor {
    
    static let orange = UIColor.hexToUIColor("#FC6016")
    static let darkGray = UIColor.hexToUIColor("#858585")
    static let lightGray = UIColor.hexToUIColor("#D5D5D5")
    static let textColor = UIColor.black.withAlphaComponent(0.45)
    static let bulletPointColor = UIColor.black
}

fileprivate extension UIColor {
    
    static func hexToUIColor(_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
