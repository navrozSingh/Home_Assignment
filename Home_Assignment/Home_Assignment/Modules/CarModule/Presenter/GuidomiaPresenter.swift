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
            case .make(name: _):
                appliedFilter[Constant.make] = filter
                appliedFilter.removeValue(forKey: Constant.model)
                display?.setModelTextField(text: nil)

            case .model(name: _):
                appliedFilter[Constant.model] = filter
                appliedFilter.removeValue(forKey: Constant.make)
                display?.setMakeTextField(text: nil)
        }
        display?.loadCell(with: getCarsForAppliedFilter())
    }
    
    func isFilterAppled() -> Bool {
        !appliedFilter.keys.isEmpty
    }
    
    func carsForPicker() -> [CarDetails] {
         formatter.getCars()
    }

    func resetFilters() {
        appliedFilter.removeAll()
        indexToOpen = 0
        
        display?.setMakeTextField(text: nil)
        display?.setModelTextField(text: nil)
    }
    
    func setExistingFilters() {
        var makeName: String?
        var modelName: String?
        if case .make(let name) = appliedFilter[Constant.make] {
            makeName = name
        }
        if case .model(let name) = appliedFilter[Constant.model] {
            modelName = name
        }
        display?.setMakeTextField(text: makeName)
        display?.setModelTextField(text: modelName)
    }
}
