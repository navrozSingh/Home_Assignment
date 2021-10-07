//
//  Display.swift
//  Home_Assignment
//
//  Created by Navroz on 07/10/21.
//

import Foundation

protocol GuidomiaDisplay {
    func loadCell(with modals: [CarDetails])
    func setMakeTextField(text: String?)
    func setModelTextField(text: String?)
}
