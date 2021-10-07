//
//  GuidomiaViewController.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import UIKit

protocol GuidomiaDisplay {
    func loadCell(with modals: [CarDetails])
    func setMakeTextField(text: String?)
    func setModelTextField(text: String?)
}

final class GuidomiaViewController: UIViewController {
    
    private struct Constant {
        static let headerFrame = CGRect(x: 0,
                                 y: 0,
                                 width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.height / 2)
        static let anyMakePlaceholder = "Any make"
        static let anyModelPlaceholder = "Any model"
        static let title = "GUIDOMIA"
        static let selected = " (Selected)"
    }
        
    private let tableView : UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.register(CarCell.self, forCellReuseIdentifier: StringConstants.carCellID)
        return table
    }()
    
    private lazy var textFieldsPicker: ToolbarPickerView = {
        let picker = ToolbarPickerView()
        picker.dataSource = self
        picker.delegate = self
        picker.toolbarDelegate = self
        return picker
    }()
    
    private var pickerDataSource: [CarDetails]?
    
    private var showingModelPicker = false
    
    private var presenter: GuidomiaPresenterRequirements?
    
    private var carDetails: [CarDetails]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private(set) lazy var modelTextField: UITextField = {
        let textField = UITextField.createTextField(placeholder: Constant.anyModelPlaceholder)
        textField.inputView = textFieldsPicker
        textField.inputAccessoryView = textFieldsPicker.toolbar
        textField.delegate = self
        textField.addShadow(ofColor: .bulletPointColor)
        return textField
    }()
    
    private(set) lazy var makeTextField: UITextField = {
        let textField = UITextField.createTextField(placeholder: Constant.anyMakePlaceholder)
        textField.inputView = textFieldsPicker
        textField.inputAccessoryView = textFieldsPicker.toolbar
        textField.delegate = self
        textField.addShadow(ofColor: .bulletPointColor)
        return textField
    }()
    
    private lazy var tableHeader: CarCellheader = {
        let header = CarCellheader(frame: Constant.headerFrame)
        header.addTextFieldsToStacks(makeTextField: makeTextField, modelTextField: modelTextField)
        header.resetFilter.addAction { [weak self] in
            self?.presenter?.resetFilters()
            self?.tableHeader.showFilterButton(false)
        }
        return header
    }()

    override func loadView() {
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        presenter = GuidomiaPresenter(display: self)
        navigationBarCustomization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.displayAllCars()
    }
}

private extension GuidomiaViewController {
        
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = tableHeader
    }
    
    func navigationBarCustomization() {
        navigationController?.addCustomColorToNavigationBar(color: .orange)
        navigationItem.titleView = navigationController?.leftAlignedTitle(title: Constant.title)
    }
}

extension GuidomiaViewController: GuidomiaDisplay {
    func loadCell(with modals: [CarDetails]) {
        carDetails = modals
    }
    
    func setMakeTextField(text: String?) {
        makeTextField.text = text
    }
    
    func setModelTextField(text: String?) {
        modelTextField.text = text
    }
}

extension GuidomiaViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.carCellID) as? CarCell else {
            preconditionFailure("cell configuration issue")
        }
        cell.configureCell(with: carDetails?[indexPath.row],
                           showProsCons: presenter?.indexToOpen ?? 0 == indexPath.row)
        return cell
    }
}
extension GuidomiaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.indexToOpen = indexPath.row
    }
}

extension GuidomiaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerDataSource?.count ?? 0
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return showingModelPicker ? pickerDataSource?[row].model ?? ""  : pickerDataSource?[row].make ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if showingModelPicker {
            modelTextField.text = pickerDataSource?[row].model ?? ""
        } else {
            makeTextField.text = pickerDataSource?[row].make ?? ""
        }
    }
}

extension GuidomiaViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        showingModelPicker = textField == modelTextField ? true : false
        pickerDataSource = presenter?.carsForFilter()
        textFieldsPicker.reloadAllComponents()
        return true
    }
}

extension GuidomiaViewController: ToolbarPickerViewDelegate {
    func didTapDone() {
        defer {
            view.endEditing(true)
            tableHeader.showFilterButton(true)
        }
        
        showingModelPicker ? presenter?.applyFilter(for: Filter.model(name: modelTextField.string)) : presenter?.applyFilter(for: Filter.make(name: makeTextField.string))
    }
    
    func didTapCancel() {
        presenter?.setExistingFilters()
        view.endEditing(true)
    }
}
