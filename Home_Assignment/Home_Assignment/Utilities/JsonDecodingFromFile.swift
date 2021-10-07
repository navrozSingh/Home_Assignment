//
//  JsonDecodingFromFile.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import Foundation

class JsonDecodingFromFile {
    
    /**
     - Function fetch  json from file.
     - Decode json into Codable
     - Returns: `[Codable]?` .
     */
    class func loadJson<T: Codable>(fileName: String) -> [T]? {
       guard
        let path = Bundle.main.url(forResource: fileName, withExtension: "json"),
        let jsonData = try? Data(contentsOf: path),
        let modals = try? JSONDecoder().decode([T].self, from: jsonData)
       else {
            return nil
       }
       return modals
    }
}
