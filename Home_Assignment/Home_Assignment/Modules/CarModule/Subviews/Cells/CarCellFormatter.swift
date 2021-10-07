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
        static let proText = " Pros: \n"
        static let consText = " Cons: \n"
    }
    
     class func getCarPrice(price: Double?) -> String {
        guard let price = price else {
            return Constant.notAvaialble
        }
        let priceAsNumber = NSNumber(value: price)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        return formatter.string(from: priceAsNumber) ?? Constant.notAvaialble
    }
    
    class func prosCons(pros: [String]?, cons: [String]?) -> NSAttributedString? {
        let result = NSMutableAttributedString()
        
        if let pros = pros?.compactMap({ $0.count > 0 ? $0 : nil }),
           !pros.isEmpty {
            result.append(prosConsString(for: Constant.proText))
            result.append(String.add(bulletList: pros, font: UIFont.bold))
        }
        if  let cons = cons?.compactMap({$0.count > 0 ? $0 : nil}),
            !cons.isEmpty {
            result.append(prosConsString(for: Constant.consText))
            result.append(String.add(bulletList: cons, font: UIFont.bold))
        }
        return result
    }

    private class func prosConsString(for prosConsString: String)-> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: prosConsString)
        let string: NSString = NSString(string: prosConsString)
        let range: NSRange = string.range(of: prosConsString)
        let textAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.bold, .foregroundColor: UIColor.darkGray]
        attributedString.addAttributes(textAttributes, range: range)
        return attributedString
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
    
    class func star(rating: Int?) -> String {
        guard let rating = rating else {
            return Constant.ratingNotAvaialble
        }
        var starString = ""
        for item in 1...5 {
            starString.append(item <= rating ? "★" : "☆")
        }
        return starString
    }
}
