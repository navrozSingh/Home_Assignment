//
//  GuidomiaPresenterTests.swift
//  Home_AssignmentTests
//
//  Created by Navroz on 08/10/21.
//

import Foundation

import XCTest
@testable import Home_Assignment

class GuidomiaPresenterTests: XCTestCase {
    
    var subject: GuidomiaPresenterRequirements?
    let display = MockGuidomiaDisplay()
    
    override func setUp() {
        subject = GuidomiaPresenter(display: display)
    }
    
    func testFilterApplied() {
        XCTAssertEqual(subject?.carsForPicker().count, 4)
        XCTAssertEqual(subject?.isFilterAppled(), false)
        subject?.applyFilter(for: Filter.make(name: "test"))
        XCTAssertEqual(subject?.isFilterAppled(), true)
        subject?.resetFilters()
        XCTAssertEqual(subject?.isFilterAppled(), false)
    }
    
    func testSubjectWithDisplay() {
        subject?.displayAllCars()
        XCTAssertEqual(display.cellLoaded, true)

        subject?.setExistingFilters()
        XCTAssertEqual(display.makeTextFieldSet, true)
        XCTAssertEqual(display.modelTextFieldSet, true)
    }
}

