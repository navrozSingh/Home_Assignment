//
//  TestGuidomiaFormatter.swift
//  Home_AssignmentTests
//
//  Created by Navroz on 08/10/21.
//

import Foundation
import XCTest
@testable import Home_Assignment

class GuidomiaFormatterTests: XCTestCase {
    var subject: GuidomiaFormatter?
    
    override func setUp() {
        subject = GuidomiaFormatter()
    }
    
    func testSubject() {
        XCTAssertEqual(subject?.getCars().count, 4)
    }
}
