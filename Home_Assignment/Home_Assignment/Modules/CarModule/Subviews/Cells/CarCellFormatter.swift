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
        static let placeholderImage = UIImage()
        
        static let Range_Rover = UIImage(named: "Range_Rover")
        static let Alpine_roadster = UIImage(named: "Alpine_roadster")
        static let BMW_330i = UIImage(named: "BMW_330i")
        static let Mercedez_benz_GLC = UIImage(named: "Mercedez_benz_GLC")
        
        static let Range_Rover_Modal = "Range Rover"
        static let Roadster_Modal = "Roadster"
        static let BMW_Modal = "3300i"
        static let GLE_coupe_Modal = "GLE coupe"

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
}
