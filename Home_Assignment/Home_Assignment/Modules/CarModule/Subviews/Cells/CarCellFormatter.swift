//
//  CarCellFormatter.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import Foundation
import UIKit

class CarCellFormatter {
    private struct Constant {
        static let notAvaialble = "NA"
        static let ratingNotAvaialble = "Rating NA"

        static let placeholderImage = UIImage()
        
        static let Range_Rover = UIImage(named: "Range_Rover")
        static let Alpine_roadster = UIImage(named: "Alpine_roadster")
        static let BMW_330i = UIImage(named: "BMW_330i")
        static let Mercedez_benz_GLC = UIImage(named: "Mercedez_benz_GLC")
        
        static let Range_Rover_Modal = "Range Rover"
        static let Roadster_Modal = "Roadster"
        static let BMW_Modal = "3300i"
        static let GLE_coupe_Modal = "GLE coupe"
        static let proText = " Pros : \n"
        static let consText = " Cons : \n"
        static let carPrice = "Price : "
        static let lastFiveChar = "000.0"
        static let thousand = "K"
        static let starSpacing = 6
        static let newLine = " \n "
    }
    
     class func getCarPrice(price: Double?) -> String {
        guard let price = price else {
            return Constant.notAvaialble
        }
        let priceString = String(price)
        guard priceString.count > 5 else {
            return Constant.carPrice + priceString
        }
        let lastSixCharacters = priceString.suffix(5)
        if lastSixCharacters == Constant.lastFiveChar {
            return Constant.carPrice + String(priceString.dropLast(5)) + Constant.thousand
        } else {
            return Constant.carPrice + priceString
        }
    }
    
    class func prosCons(pros: [String]?, cons: [String]?) -> NSAttributedString? {
        let result = NSMutableAttributedString()
        
        if let pros = pros?.compactMap({ $0.count > 0 ? $0 : nil }),
           !pros.isEmpty {
            result.append(prosConsString(for: Constant.proText))
            result.append(String.addBullet(List: pros, font: UIFont.semiBold))
        }
        if  let cons = cons?.compactMap({$0.count > 0 ? $0 : nil}),
            !cons.isEmpty {
            result.append(prosConsString(for: Constant.consText))
            result.append(String.addBullet(List: cons, font: UIFont.semiBold))
        }
        return result
    }

    private class func prosConsString(for prosConsString: String)-> NSAttributedString {        
        let textAttributes = String.paragraphStyle(textFont: UIFont.bold, textColor: UIColor.darkGray)
        return NSAttributedString(string: prosConsString, attributes: textAttributes.0)
    }
    
     class func carName(from modal: CarDetails?) -> String {
        guard let modal = modal else {
            return Constant.notAvaialble
        }
        return (modal.make ?? "") + " " + (modal.model ?? "")
    }
        
    class func imageMapper(modal: String?) -> UIImage {
        guard let modal = modal else {
            return Constant.placeholderImage
        }
        var carImage: UIImage?
        
        switch modal {
            case Constant.Range_Rover_Modal:
                carImage = Constant.Range_Rover
            case Constant.Roadster_Modal:
                carImage = Constant.Alpine_roadster
            case Constant.BMW_Modal:
                carImage = Constant.BMW_330i
            case Constant.GLE_coupe_Modal:
                carImage = Constant.Mercedez_benz_GLC
            default: carImage = nil
        }
        return carImage ?? Constant.placeholderImage
    }

    class func star(rating: Int?) -> NSAttributedString {
        guard let rating = rating else {
            return NSAttributedString(string: Constant.ratingNotAvaialble)
        }
        var starString = ""
        for item in 1...5 {
            starString.append(item <= rating ? "★" : "☆")
        }
        return NSAttributedString(string: starString, attributes: [.kern: Constant.starSpacing])
    }
}
