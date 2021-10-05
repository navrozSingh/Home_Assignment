//
//  CarCell.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import UIKit
import Foundation
    
final class CarCell: UITableViewCell {
    
    private struct Constant {
        static let padding: CGFloat = 16
        static let imageHeight: CGFloat = 80
        static let imageWidth: CGFloat = 120
        static let carDetailStackHeight: CGFloat = 150
    }
    
    private lazy var horizontalCarDetailsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.addArrangedSubview(carImage)
//        carImage.addWHConstraint(width: Constant.imageWidth,
//                                 height: Constant.imageHeight)

        stackView.addArrangedSubview(verticalCarDetailsStack)

        return stackView
    }()
    
    private lazy var verticalCarDetailsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(carName)
        stackView.addArrangedSubview(carPrice)

        return stackView
    }()
    
    private lazy var carName = UILabel.createLabel(textStyle: .headline,
                                                   numberOfLines: 0)
    
    private lazy var carPrice = UILabel.createLabel()
    
    private let carImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupCarDetailStack()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCarDetailStack()
    }

    func configureCell(with modal: CarDetails?) {
        self.contentView.backgroundColor = UIColor.lightGray
        carName.text = CarCellFormatter.carName(from: modal)
        carPrice.text = CarCellFormatter.getCarPrice(price: modal?.marketPrice)
        carImage.image = CarCellFormatter.imageMapper(modal: modal?.model)
        carImage.backgroundColor = .black
    }
}

private extension CarCell {
    func setupCarDetailStack() {
        contentView.addSubview(horizontalCarDetailsStack)
        NSLayoutConstraint.activate([
            horizontalCarDetailsStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            horizontalCarDetailsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalCarDetailsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalCarDetailsStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            horizontalCarDetailsStack.heightAnchor.constraint(equalToConstant: Constant.carDetailStackHeight),
            verticalCarDetailsStack.heightAnchor.constraint(equalTo: horizontalCarDetailsStack.heightAnchor)
        ])
    }
}
