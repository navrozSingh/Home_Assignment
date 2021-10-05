//
//  CarDetails.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import Foundation

struct CarDetails : Codable {
//    private(set) var id: String? = NSUUID().uuidString
    let consList : [String]?
    let customerPrice : Double?
    let make : String?
    let marketPrice : Double?
    let model : String?
    let prosList : [String]?
    let rating : Int?
}

