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
        static let imageHeight: CGFloat = 100
        static let imageWidth: CGFloat = 140
        static let carDetailStackHeight: CGFloat = 150
        static let defaultHeightProsConsHeight: CGFloat = 0
    }
    
    private lazy var horizontalCarDetailsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = Constant.padding
        stackView.addArrangedSubview(carImage)
        stackView.addArrangedSubview(verticalCarDetailsStack)
        return stackView
    }()
    
    private lazy var verticalCarDetailsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(carNamePrice)
        stackView.addArrangedSubview(starView)
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(horizontalCarDetailsStack)
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
    
    private lazy var prosConsTextViewHeight = prosConsTextView.heightAnchor.constraint(equalToConstant: Constant.defaultHeightProsConsHeight)
    
    // Used one label to match UI
    private lazy var carNamePrice: UILabel = {
        let label = UILabel.createLabel(numberOfLines: 0)
//        label.heightAnchor.constraint(lessThanOrEqualToConstant: 120).isActive = true
//        constraint.isActive = true
//        constraint.priority = .defaultLow
        return label
    }()
    
    private lazy var starView = UILabel.createLabel(font: UIFont.bold, color: UIColor.orange)
    
    private let carImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupSeparatorView()
        setupCarDetailStack()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSeparatorView()
        setupCarDetailStack()
    }

    func configureCell(with modal: CarDetails?, showProsCons: Bool = false) {
        self.contentView.backgroundColor = UIColor.lightGray
        carNamePrice.attributedText = CarCellFormatter.carNameAndPrice(modal: modal)
        carImage.image = CarCellFormatter.imageMapper(modal: modal?.model)
        starView.text = CarCellFormatter.star(rating: modal?.rating)
        if showProsCons,
           let points = CarCellFormatter.prosCons(pros: modal?.prosList, cons: modal?.consList) {
            prosConsTextView.isHidden = false
            prosConsTextView.attributedText = points
        } else {
            prosConsTextView.isHidden = true
        }
    }
}

private extension CarCell {
    func setupCarDetailStack() {
        contentView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: Constant.padding),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -Constant.padding),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(Constant.padding*2))
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
