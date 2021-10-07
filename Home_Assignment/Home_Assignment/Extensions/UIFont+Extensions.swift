//
//  UIFont+Extensions.swift
//  Home_Assignment
//
//  Created by Navroz on 06/10/21.
//

import UIKit

extension UIFont {
    
    static var boldForTitle: UIFont {
        return UIFont(name: "TimesNewRomanPS-BoldMT", size: 20) ?? UIFont.systemFont(ofSize: 25)
    }

    static var bold: UIFont {
        return UIFont.boldSystemFont(ofSize: 20.0)
    }
    
    static var semiBold: UIFont {
        return UIFont.boldSystemFont(ofSize: 16.0)
    }

    static var smallBold: UIFont {
        return UIFont.boldSystemFont(ofSize: 14.0)
    }
    
    static func boldFont(with size: CGFloat = 20.0) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)

    }
}

