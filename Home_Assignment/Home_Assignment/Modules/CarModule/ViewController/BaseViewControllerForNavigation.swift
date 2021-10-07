//
//  BaseViewControllerForNavigation.swift
//  Home_Assignment
//
//  Created by Navroz on 08/10/21.
//

import UIKit

 class BaseViewControllerForNavigation: UIViewController {

    func navigationBarCustomization(title: String) {
        navigationController?.addCustomColorToNavigationBar(color: .orange)
        navigationItem.titleView = navigationController?.leftAlignedTitle(title: title)
    }
}
