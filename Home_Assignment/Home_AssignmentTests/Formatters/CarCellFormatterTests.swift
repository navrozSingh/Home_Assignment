//
//  CellFormaterTests.swift
//  Home_AssignmentTests
//
//  Created by Navroz on 08/10/21.
//

import XCTest
@testable import Home_Assignment
import Foundation

class CarCellFormatterTests: XCTestCase {
    
    func testSubject() {
        XCTAssertEqual(CarCellFormatter.star(rating: nil), NSAttributedString(string: "Rating NA"))
        
        let output = NSAttributedString(string: String("★" + "☆" + "☆" + "☆" + "☆"), attributes: [.kern: 6])
        XCTAssertEqual(CarCellFormatter.star(rating: 1), output)

        XCTAssertEqual(CarCellFormatter.carName(from: nil), "NA")

        let cars: [CarDetails] = GuidomiaFormatter().getCars()
        XCTAssertEqual(CarCellFormatter.carName(from: cars[0]), "Land Rover Range Rover")
        
        XCTAssertEqual(CarCellFormatter.getCarPrice(price: nil), "NA")
        XCTAssertEqual(CarCellFormatter.getCarPrice(price: 10.0), "Price : 10.0")
        XCTAssertEqual(CarCellFormatter.getCarPrice(price: 10000.0), "Price : 10K")
        
        XCTAssertEqual(CarCellFormatter.prosCons(pros: nil, cons: nil), NSAttributedString(string:""))

    }

}
