//
//  MockGuidomiaDisplay.swift
//  Home_AssignmentTests
//
//  Created by Navroz on 08/10/21.
//

@testable import Home_Assignment

class MockGuidomiaDisplay: GuidomiaDisplay {
    var cellLoaded = false
    func loadCell(with modals: [CarDetails]) {
        cellLoaded = true
    }
    
    var makeTextFieldSet = false
    func setMakeTextField(text: String?) {
        makeTextFieldSet = true
    }
    
    var modelTextFieldSet = false
    func setModelTextField(text: String?) {
        modelTextFieldSet = true
    }
}
