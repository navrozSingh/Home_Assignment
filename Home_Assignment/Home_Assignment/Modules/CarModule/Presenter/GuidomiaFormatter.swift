//
//  GuidomiaFormatter.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import Foundation

final class GuidomiaFormatter {
    // For Caching the records
    private var cars: [CarDetails]?
    
    /**
     # Function fetch  json from file & cache the records in local variable.
     - Returns: `[CarDetails]` .
     */
    func getCars() -> [CarDetails] {
        if let cars = cars {
            return cars
        }
        return loadFromJson()
    }
    
    private func loadFromJson() -> [CarDetails] {
        guard let cars: [CarDetails] = JsonDecodingFromFile.loadJson(fileName: "car_list")
        else {
            preconditionFailure("Unable to read from Json File")
        }
        self.cars = cars
        return cars
    }
}
