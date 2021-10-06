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
            if !filterAppled() {
                display?.loadCell(with: formatter.getCars())
            }
        }
    }
    
    private var appliedFilter = [String: Filter]()
    
    private var display: GuidomiaDisplay?
    
    private let formatter: GuidomiaFormatter
    
    private var allCars: [CarDetails]?
    
    init(display: GuidomiaDisplay,
         formatter: GuidomiaFormatter = .init()) {
        self.display = display
        self.formatter = formatter
    }

    func displayAllCars() {
        display?.loadCell(with: formatter.getCars())
    }

    func getCarsForAppliedFilter() -> [CarDetails] {
        
        var result = formatter.getCars()
        
        if case .make(let name) = appliedFilter["make"] {
            result = result.filter{ $0.make == name }
        } else if case .model(let name) = appliedFilter["model"] {
            result = result.filter{ $0.model == name }
        }
        
        return result
    }

    func applyFilter(for filter: Filter) {
        
        switch filter {
            case .make(name: _): appliedFilter["make"] = filter
            case .model(name: _): appliedFilter["model"] = filter
        }
        display?.loadCell(with: getCarsForAppliedFilter())
    }
    
    func filterAppled() -> Bool {
        !appliedFilter.keys.isEmpty
    }
}


protocol GuidomiaPresenterRequirements {
    func displayAllCars()
    func getCarsForAppliedFilter() -> [CarDetails]
    func applyFilter(for: Filter)
    var indexToOpen: Int? { get set }
    func filterAppled() -> Bool
}

enum Filter {
    case make(name: String)
    case model(name: String)
}
