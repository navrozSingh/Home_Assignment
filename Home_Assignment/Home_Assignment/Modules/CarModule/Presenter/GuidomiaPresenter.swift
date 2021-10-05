//
//  GuidomiaPresenter.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import Foundation

class GuidomiaPresenter: GuidomiaPresenterRequirements {
    private var display: GuidomiaDisplay?
    private let formatter: GuidomiaFormatter
    
    init(display: GuidomiaDisplay,
         formatter: GuidomiaFormatter = .init()) {
        self.display = display
        self.formatter = formatter
    }

    func getAllCars() {
        guard let carDetails = formatter.getCarsFromJson() else {
            preconditionFailure("Unable to read from Json File")
        }
        display?.loadAllCell(with: carDetails)
    }

    func filterCars(for filter: Filter) {
        
    }
}


protocol GuidomiaPresenterRequirements {
    func getAllCars()
    func filterCars(for filter: Filter)
}

enum Filter {
    case make(year: Int)
    case modal(name: String)
}
