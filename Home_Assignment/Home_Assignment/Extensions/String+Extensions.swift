//
//  String+Extensions.swift
//  Home_Assignment
//
//  Created by Navroz on 06/10/21.
//

import Foundation
import UIKit

extension String {
    
    static func addBullet(List strings: [String],
                   font: UIFont,
                   indentation: CGFloat = 15,
                   lineSpacing: CGFloat = 2,
                   paragraphSpacing: CGFloat = 5,
                   textColor: UIColor = .bulletPointColor,
                   bulletColor: UIColor = .orange) -> NSAttributedString {
        
        func createParagraphAttirbute() -> NSParagraphStyle {
            
            guard let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as? NSMutableParagraphStyle,
                let nonOptions = NSDictionary() as? [NSTextTab.OptionKey: Any]
            else {
                return NSParagraphStyle()
            }
            
            paragraphStyle.tabStops = [ NSTextTab(textAlignment: .left,
                                                  location: indentation, options: nonOptions)]
            paragraphStyle.defaultTabInterval = indentation
            paragraphStyle.firstLineHeadIndent = 0
            paragraphStyle.lineSpacing = lineSpacing
            paragraphStyle.paragraphSpacing = paragraphSpacing
            paragraphStyle.headIndent = indentation
            return paragraphStyle
        }
        
        let bulletPoint = "  \u{2022}"
        let textAttributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: textColor]
        let bulletAttributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: bulletColor]
        let buffer = NSMutableAttributedString.init()
        
        for string in strings {
            let formattedString = "\(bulletPoint)\t\(string)\n"
            let attributedString = NSMutableAttributedString(string: formattedString)
            let paragraphstyle = paragraphStyle(textFont: font).1
            
            attributedString.addAttributes(
                [NSAttributedString.Key.paragraphStyle : paragraphstyle],
                range: NSMakeRange(0, attributedString.length))
            
            attributedString.addAttributes(
                textAttributes,
                range: NSMakeRange(0, attributedString.length))
            
            let string:NSString = NSString(string: formattedString)
            let rangeForBullet:NSRange = string.range(of: bulletPoint)
            attributedString.addAttributes(bulletAttributes, range: rangeForBullet)
            buffer.append(attributedString)
        }
        
        return buffer
    }
    
    static func paragraphStyle(textFont: UIFont,
                             indentation: CGFloat = 15,
                             lineSpacing: CGFloat = 2,
                             paragraphSpacing: CGFloat = 5,
                             textColor: UIColor = .black) -> ([NSAttributedString.Key: Any], NSParagraphStyle) {
        guard let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as? NSMutableParagraphStyle,
              let nonOptions = NSDictionary() as? [NSTextTab.OptionKey: Any]
        else {
            return ([NSAttributedString.Key: Any](), NSParagraphStyle())
        }
        
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .left,
                                              location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.headIndent = indentation
        return ([
            .font: textFont,
            .foregroundColor: textColor,
            .paragraphStyle: paragraphStyle
        ], paragraphStyle)
    }
}
