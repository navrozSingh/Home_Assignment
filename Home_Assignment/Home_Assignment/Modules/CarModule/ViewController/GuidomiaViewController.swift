//
//  GuidomiaViewController.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import UIKit

final class GuidomiaViewController: UIViewController {
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.register(CarCell.self, forCellReuseIdentifier: "CarCell")
        return table
    }()
    
    private var presenter: GuidomiaPresenterRequirements?
    
    private var carDetails: [CarDetails]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func loadView() {
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = GuidomiaPresenter(display: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTableView()
        presenter?.getAllCars()
    }
}

private extension GuidomiaViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension GuidomiaViewController: GuidomiaDisplay {
    func loadAllCell(with modals: [CarDetails]) {
        carDetails = modals
    }
}

extension GuidomiaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell") as? CarCell else {
            preconditionFailure("cell configuration issue")
        }
        cell.configureCell(with: carDetails?[indexPath.row])
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        180
//    }

}

protocol GuidomiaDisplay {
    func loadAllCell(with modals: [CarDetails])

}
