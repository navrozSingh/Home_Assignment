//
//  GuidomiaViewController.swift
//  Home_Assigment
//
//  Created by Navroz on 05/10/21.
//

import UIKit

final class GuidomiaViewController: UIViewController {
    
    private let tableView : UITableView = {
        let table = UITableView()
//        table.separatorStyle = .none
        return table
    }()
    
    override func loadView() {
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTableView()
    }
}

private extension GuidomiaViewController {
    func setupTableView() {
        tableView.dataSource = self
    }
}


extension GuidomiaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
