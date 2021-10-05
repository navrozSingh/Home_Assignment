//
//  GuidomiaFormatter.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import Foundation

final class GuidomiaFormatter {
     func getCarsFromJson() -> [CarDetails]? {
        JsonDecodingFromFile.loadJson(fileName: "car_list")
    }
}
