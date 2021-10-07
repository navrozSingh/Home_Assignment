//
//  CarCellheader.swift
//  Home_Assignment
//
//  Created by Navroz on 06/10/21.
//

import UIKit
import Foundation

class CarCellHeader: UIView {
    
    // MARK: Private class variables
    private enum Constant {
        static let containerHeight: CGFloat = UIScreen.main.bounds.height / 2
        static let textFieldViewHeight: CGFloat = 150.0
        static let labelHeight: CGFloat = 32.0
        static let paddingForFilter: CGFloat = 16.0
        static let cornerRadius: CGFloat = 8.0
        static let carImageBottomPadding: CGFloat = -15.0
        static let tacmoSubLabelBottom: CGFloat = -40
        static let tacmoLabelText = "Tacoma 2021"
        static let tacmoSubLabelText = "Get your's now"
        static let filerPlaceholder = "Filters"
        static let restFilter = "Rest Filters"
        static let headerCarImage = UIImage(named: "Tacoma")!
    }
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        return containerView
    }()
    
    private lazy var filterLabel: UILabel = {
        let label = UILabel.createLabel(font: UIFont.bold, color: .white)
        label.text = Constant.filerPlaceholder
        return label
    }()
    
     lazy var resetFilter: UIButton = {
        let btn = UIButton()
        btn.setTitle(Constant.restFilter, for: .normal)
        btn.titleLabel?.font = UIFont.semiBold
        btn.isHidden = true
        return btn
    }()

    private lazy var tacmoLabel: UILabel = {
        let label = UILabel.createLabel(numberOfLines: 1,
                                        font: UIFont.boldFont(with: 40),
                                        color: .white)
        label.text = Constant.tacmoLabelText
        return label
    }()
    
    private lazy var tacmoSubLabel: UILabel = {
        let label = UILabel.createLabel(numberOfLines: 1, font: UIFont.bold, color: .white)
        label.text = Constant.tacmoSubLabelText
        return label
    }()
    
    private lazy var containerViewForFilter: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .darkGray
        containerView.layer.cornerRadius = Constant.cornerRadius
        return containerView
    }()

    private let headerCarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.headerCarImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var filterStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.addArrangedSubview(filterLabel)
        stackView.addArrangedSubview(resetFilter)
        return stackView
    }()
    
    // MARK: View Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    /**
     - `addTextFieldsToStacks()` offer to add `make` & `model` Textfields to the header view.
     */
    func addTextFieldsToStacks(makeTextField: UITextField, modelTextField: UITextField) {
        filterStack.addArrangedSubview(makeTextField)
        filterStack.addArrangedSubview(modelTextField)
    }
    
    /**
     - `showFilterButton()` enable caller to show or hide `reset filter button`
     - Parameters - `show` is a boolean value to decide show or hide `reset filter button`
     */
    func showFilterButton(_ show: Bool) {
        if show {
            filterLabel.isHidden = true
            resetFilter.isHidden = false
        } else {
            filterLabel.isHidden = false
            resetFilter.isHidden = true
        }
    }
}

// MARK: An extension to setup views
private extension CarCellHeader {
    func setupUI() {
        self.addSubview(containerView)
        containerViewForFilter.addSubview(filterStack)
        containerView.addSubview(containerViewForFilter)
        containerView.addSubview(headerCarImage)
        containerView.addSubview(tacmoLabel)
        containerView.addSubview(tacmoSubLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            containerViewForFilter.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                            constant: Constant.paddingForFilter),
            containerViewForFilter.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                             constant: -Constant.paddingForFilter),
            containerViewForFilter.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,
                                                           constant: -Constant.paddingForFilter),
            containerViewForFilter.heightAnchor.constraint(equalToConstant: Constant.textFieldViewHeight ),
            
            filterStack.leadingAnchor.constraint(equalTo: containerViewForFilter.leadingAnchor,
                                                 constant: Constant.paddingForFilter),
            filterStack.topAnchor.constraint(equalTo: containerViewForFilter.topAnchor),
            filterStack.trailingAnchor.constraint(equalTo: containerViewForFilter.trailingAnchor,
                                                  constant: -Constant.paddingForFilter),
            filterStack.bottomAnchor.constraint(equalTo: containerViewForFilter.bottomAnchor,
                                                constant: -Constant.paddingForFilter),

            headerCarImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            headerCarImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            headerCarImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            headerCarImage.bottomAnchor.constraint(equalTo: containerViewForFilter.topAnchor, constant: Constant.carImageBottomPadding),
            
            tacmoSubLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constant.paddingForFilter + 5 ),
            tacmoSubLabel.bottomAnchor.constraint(equalTo: containerViewForFilter.topAnchor, constant: Constant.tacmoSubLabelBottom),
            
            tacmoLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constant.paddingForFilter),
            tacmoLabel.bottomAnchor.constraint(equalTo: tacmoSubLabel.topAnchor)
        ])
    }
}
