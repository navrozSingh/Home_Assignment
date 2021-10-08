//
//  Display.swift
//  Home_Assignment
//
//  Created by Navroz on 07/10/21.
//

import Foundation

protocol GuidomiaDisplay: AnyObject {
    /**
     - `loadCell(with modals: [CarDetails])` used to reload dataSources.
     - Parameters: `[CarDetails]` object to be passed controller.
     */
    func loadCell(with modals: [CarDetails])
    
    /**
     - `setMakeTextField(text: String?)` used to set MakeTextField.
     - Parameters: `text: String?`
     */
    func setMakeTextField(text: String?)
    
    /**
     - `setModelTextField(text: String?)` used to set ModelTextField.
     - Parameters: `text: String?`
     */
    func setModelTextField(text: String?)
}
