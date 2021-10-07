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
            isFilterAppled() ? display?.loadCell(with: getCarsForAppliedFilter()):
                display?.loadCell(with: formatter.getCars())
        }
    }
    
    private var appliedFilter = [String: Filter]()
    
    private var display: GuidomiaDisplay?
    
    private let formatter: GuidomiaFormatter
    
    private var allCars: [CarDetails]?
    
    private struct Constant {
        static let make = "make"
        static let model = "model"
    }
    
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
        if case .make(let name) = appliedFilter[Constant.make] {
            result = result.filter{ $0.make == name }
        } else if case .model(let name) = appliedFilter[Constant.model] {
            result = result.filter{ $0.model == name }
        }
        return result
    }

    func applyFilter(for filter: Filter) {
        
        switch filter {
            case .make(name: _): appliedFilter[Constant.make] = filter
            case .model(name: _): appliedFilter[Constant.model] = filter
        }
        display?.loadCell(with: getCarsForAppliedFilter())
    }
    
    func isFilterAppled() -> Bool {
        !appliedFilter.keys.isEmpty
    }
    
    func modelDataSource() -> [CarDetails] {
        var result = formatter.getCars()
        result = result.map {
            var car = $0
            if case .make(let name) = appliedFilter[Constant.make],
               car.make == name {
                car.filteredApplied = true
                return car
            } else if case .model(let name) = appliedFilter[Constant.model],
                      car.model == name {
                return car
            } else {
                return car
            }
        }
        return result
    }
    
    func getAppliedFilter() -> (String?, String?) {
        var makeName: String?
        var modelName: String?
        
        if case .make(let name) = appliedFilter[Constant.make] {
            makeName = name
        } else if case .model(let name) = appliedFilter[Constant.model] {
            modelName = name
        }
        return (makeName, modelName)
    }

}


protocol GuidomiaPresenterRequirements {
    var indexToOpen: Int? { get set }
    func displayAllCars()
    func getCarsForAppliedFilter() -> [CarDetails]
    func modelDataSource() -> [CarDetails]
    func applyFilter(for: Filter)
    func isFilterAppled() -> Bool
}

enum Filter {
    case make(name: String)
    case model(name: String)
}
