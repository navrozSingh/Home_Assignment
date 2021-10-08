//
//  GuidomiaPresenterRequirements.swift
//  Home_Assignment
//
//  Created by Navroz on 07/10/21.
//

import Foundation

protocol GuidomiaPresenterRequirements: AnyObject {
    /**
     - `indexToOpen` used to manage opening and closing cells.
     - default is nil
     */
    var indexToOpen: Int? { get set }
    
    /**
     - Caller will call `displayAllCars()`  to get all cars fetched from json file.
     */
    func displayAllCars()
    
    /**
     - Func `getCarsForAppliedFilter()` will return filtered cars based upon car `make` & `model` filters.
     */
    func getCarsForAppliedFilter() -> [CarDetails]
    
    /**
     -  `carsForPicker()` will return all cars to used  in filteration process
     */
    func carsForPicker() -> [CarDetails]
    
    /**
     - `applyFilter(for: Filter)` used to apply filter.
     -  As per the requirement user can select make **or** a model
     -  Incase user selected a make filter then tries to appy model filter
     -  The function will remove last applied filter
     - Parameters: `Filter` object to be passed by caller, by which filteration will take place.
     */
    func applyFilter(for: Filter)
    
    /**
     -  `resetFilters()` used to clear all the applied filters.
     */
    func resetFilters()
    
    /**
     -  `isFilterAppled()`  used  check is any filters applied.
     - Returns: A boolean vaule .
     */
    func isFilterAppled() -> Bool
    
    /**
     - User have an option to dismiss the  picker sheet but till then value is shown to the user
     -  `setExistingFilters()` is used  to set existing applied filters.
     */
    func setExistingFilters()
}
