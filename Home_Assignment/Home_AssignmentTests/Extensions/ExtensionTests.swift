//
//  ExtensionTests.swift
//  Home_AssignmentTests
//
//  Created by Navroz on 08/10/21.
//

import Foundation
import XCTest
@testable import Home_Assignment

class ExtensionTests: XCTestCase {
    
    func testlabel() {
        let subjectLabel = UILabel.createLabel(numberOfLines: 2,
                                               font:  UIFont.bold,
                                               color:  UIColor.textColor)
        XCTAssertEqual(subjectLabel.numberOfLines, 2)
        XCTAssertEqual(subjectLabel.font, UIFont.bold)
        XCTAssertEqual(subjectLabel.textColor, UIColor.textColor)
    }
    
    func testTextField() {
        let subjectTextField = UITextField.createTextField(backgroundColor: .white,
                                                           placeholder: "placeholderString",
                                                           leftSpace: 16.0,
                                                           cornerRadius: 8.0)
        XCTAssertEqual(subjectTextField.backgroundColor, .white)
        XCTAssertEqual(subjectTextField.placeholder, "placeholderString")
        XCTAssertEqual(subjectTextField.leftView?.frame.width, 16.0)
        XCTAssertEqual(subjectTextField.layer.cornerRadius, 8.0)
        
    }
    
    func testViewAddShadow() {
        let subjectView = UIView()
        subjectView.addShadow(ofColor: UIColor.black, radius: 3, offset: .zero, opacity: 0.5)
        XCTAssertEqual(subjectView.layer.shadowColor, UIColor.black.cgColor)
        XCTAssertEqual(subjectView.layer.shadowOffset, .zero)
        XCTAssertEqual(subjectView.layer.shadowRadius, 3)
        XCTAssertEqual(subjectView.layer.shadowOpacity, 0.5)
    }
}
