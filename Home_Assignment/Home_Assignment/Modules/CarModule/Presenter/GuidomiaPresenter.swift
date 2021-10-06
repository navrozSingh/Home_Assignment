//
//  GuidomiaPresenter.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import Foundation

class GuidomiaPresenter: GuidomiaPresenterRequirements {
    var indexToOpen: Int? {
        didSet {
            if !filterApplied {
                display?.loadAllCell(with: formatter.getCars())
            }
        }
    }
    
    private var filterApplied = false
    
    private var display: GuidomiaDisplay?
    
    private let formatter: GuidomiaFormatter
    
    private var allCars: [CarDetails]?
    
    init(display: GuidomiaDisplay,
         formatter: GuidomiaFormatter = .init()) {
        self.display = display
        self.formatter = formatter
    }

    func getAllCars() {
        display?.loadAllCell(with: formatter.getCars())
    }

    func filterCars(for filter: Filter) {
        
    }
}


protocol GuidomiaPresenterRequirements {
    func getAllCars()
    func filterCars(for filter: Filter)
    var indexToOpen: Int? { get set }
}

enum Filter {
    case make(year: Int)
    case modal(name: String)
}
