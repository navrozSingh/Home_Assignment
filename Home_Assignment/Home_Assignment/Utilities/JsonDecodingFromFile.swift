//
//  JsonDecodingFromFile.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import Foundation

class JsonDecodingFromFile {
    
    class func loadJson(fileName: String) -> [CarDetails]? {
       guard
        let path = Bundle.main.url(forResource: fileName, withExtension: "json"),
        let jsonData = try? Data(contentsOf: path),
        let modals = try? JSONDecoder().decode([CarDetails].self, from: jsonData)
       else {
            return nil
       }
       return modals
    }
}
