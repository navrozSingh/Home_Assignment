//
//  CarCell.swift
//  Home_Assignment
//
//  Created by Navroz on 05/10/21.
//

import UIKit
import Foundation
    
final class CarCell: UITableViewCell {
    
    // MARK: - Private class variables
    private struct Constant {
        static let padding: CGFloat = 16.0
        static let labelHeight: CGFloat = 32.0
        static let imageHeight: CGFloat = 80.0
        static let imageWidth: CGFloat = 120.0
        static let stackSpacing: CGFloat = -25.0
        static let carDetailStackHeight: CGFloat = 150.0
        static let carNameTop: CGFloat = 20
        static let animationDuration: Double = 4
    }
        
    private lazy var carDetailsView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(carImage)
        containerView.addSubview(carName)
        containerView.addSubview(carPrice)
        containerView.addSubview(starLabel)
        return containerView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Constant.stackSpacing
        stackView.addArrangedSubview(carDetailsView)
        stackView.addArrangedSubview(prosConsTextView)
        return stackView
    }()
    
    private lazy var prosConsTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.lightGray
        textView.isHidden = true
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var separatorView: UIView = {
        let separatorLine = UIView()
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.backgroundColor = .orange

        let separatorView = UIView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .white
        separatorView.addSubview(separatorLine)
        
        NSLayoutConstraint.activate([
            separatorLine.heightAnchor.constraint(equalToConstant: Constant.padding/4),
            separatorLine.leadingAnchor.constraint(equalTo: separatorView.leadingAnchor, constant: Constant.padding),
            separatorLine.trailingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: -(Constant.padding)),
            separatorLine.centerXAnchor.constraint(equalTo: separatorView.centerXAnchor),
            separatorLine.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor)
        ])
        
        return separatorView
    }()
        
    private lazy var carName: UILabel = {
        let label = UILabel.createLabel(numberOfLines: 0,font: UIFont.bold, color: UIColor.darkGray)
        return label
    }()
    
    private lazy var carPrice = UILabel.createLabel(numberOfLines: 0,font: UIFont.semiBold, color: UIColor.darkGray)

    private lazy var starLabel = UILabel.createLabel(font: UIFont.semiBold, color: UIColor.orange)
    
    private let carImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupSeparatorView()
        setupCarDetailsView()
        setupCarDetailStack()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSeparatorView()
        setupCarDetailsView()
        setupCarDetailStack()
    }
    
    func configureCell(with model: CarDetails?, showProsCons: Bool = false) {
        self.contentView.backgroundColor = UIColor.lightGray
        carName.text = CarCellFormatter.carName(from: model)
        carPrice.text = CarCellFormatter.getCarPrice(price: model?.customerPrice)
        carImage.image = CarCellFormatter.imageMapper(modal: model?.model)
        starLabel.attributedText = CarCellFormatter.star(rating: model?.rating)
        if showProsCons {
            showProsConsSection(model)
        } else {
            prosConsTextView.isHidden = true
        }
    }
    
    private func showProsConsSection(_ model: CarDetails?) {
        mainStackView.spacing = CarCellFormatter.cellStackPadding(model: model)
        let points = CarCellFormatter.prosCons(pros: model?.prosList,
                                               cons: model?.consList)
        prosConsTextView.isHidden = false
        UIView.animate(withDuration: Constant.animationDuration) { [weak self] in
            self?.prosConsTextView.attributedText = points
        }
    }
}

// MARK: - An extension to setup views
private extension CarCell {
    func setupCarDetailStack() {
        contentView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: Constant.padding + 4),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -Constant.padding),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(Constant.padding*2))
        ])
    }
    
    func setupCarDetailsView() {
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: carDetailsView.topAnchor, constant: Constant.padding),
            carImage.leadingAnchor.constraint(equalTo: carDetailsView.leadingAnchor),
            carImage.widthAnchor.constraint(equalToConstant: Constant.imageWidth),
            carImage.heightAnchor.constraint(equalToConstant: Constant.imageHeight),
            
            carName.topAnchor.constraint(equalTo: carDetailsView.topAnchor, constant: Constant.carNameTop),
            carName.leadingAnchor.constraint(equalTo: carImage.trailingAnchor,
                                             constant: Constant.padding),
            carName.trailingAnchor.constraint(equalTo: carDetailsView.trailingAnchor),

            carPrice.topAnchor.constraint(equalTo: carName.bottomAnchor,
                                          constant: -Constant.padding/2),
            carPrice.leadingAnchor.constraint(equalTo: carImage.trailingAnchor,
                                              constant: Constant.padding),
            carPrice.trailingAnchor.constraint(equalTo: carDetailsView.trailingAnchor),
            carPrice.heightAnchor.constraint(equalToConstant: Constant.labelHeight),

            starLabel.topAnchor.constraint(equalTo: carPrice.bottomAnchor),
            starLabel.leadingAnchor.constraint(equalTo: carImage.trailingAnchor,
                                               constant: Constant.padding),
            starLabel.trailingAnchor.constraint(equalTo: carDetailsView.trailingAnchor),
            starLabel.heightAnchor.constraint(equalToConstant: Constant.labelHeight),
            starLabel.bottomAnchor.constraint(equalTo: carDetailsView.bottomAnchor,
                                              constant: -(Constant.padding * 1.5))

        ])
    }
    
    func setupSeparatorView() {
        contentView.addSubview(separatorView)
        NSLayoutConstraint.activate([
            separatorView.heightAnchor.constraint(equalToConstant: Constant.padding*2),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
