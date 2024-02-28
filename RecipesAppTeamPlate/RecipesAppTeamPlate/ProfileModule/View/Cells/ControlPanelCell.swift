// ControlPanelCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка контроля управления
class ControlPanelCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let textForBonusesLabel = "Bonuses"
        static let textForPrivacyTerms = "Terms & Privacy Policy"
        static let nameForImagePrivacyTerms = "doc.text.fill"
        static let nameForImageLogOut = "arrow.backward.square.fill"
        static let textForLogOut = "Log out"
        static let nameFontName = "Verdana"
    }

    // MARK: - Visual Components

    private let bonusesImageButton: UIButton = {
        let button = UIButton()
        button.setImage(.star, for: .normal)
        button.backgroundColor = .appLightGray
        button.tintColor = .appPaleBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let privacyTermsImageButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(
                systemName: Constants.nameForImagePrivacyTerms
            ),
            for: .normal
        )
        button.backgroundColor = .appLightGray
        button.tintColor = .appPaleBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let logOutImageButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(
                systemName: Constants.nameForImageLogOut
            ),
            for: .normal
        )
        button.backgroundColor = .appLightGray
        button.tintColor = .appPaleBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let bonusesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForBonusesLabel
        label.textColor = .darkGray
        label.font = UIFont(name: Constants.nameFontName, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let privacyTermsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForPrivacyTerms
        label.textColor = .darkGray
        label.font = UIFont(name: Constants.nameFontName, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let logOutLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForLogOut
        label.textColor = .darkGray
        label.font = UIFont(name: Constants.nameFontName, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bottomLineBonuses: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: 89, y: 76, width: 249, height: 1)
        layer.backgroundColor = UIColor.systemGray6.cgColor
        return layer
    }()

    private let bottomLinePrivacyTerms: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: 89, y: 144, width: 249, height: 1)
        layer.backgroundColor = UIColor.systemGray6.cgColor
        return layer
    }()

    private let bottomLineLogOut: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: 89, y: 217, width: 249, height: 1)
        layer.backgroundColor = UIColor.systemGray6.cgColor
        return layer
    }()

    private lazy var showBonusesButton: UIButton = {
        let button = UIButton()
        button.setImage(.rightIcon, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(showBonuses), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let showPrivacyTermsButton: UIButton = {
        let button = UIButton()
        button.setImage(.rightIcon, for: .normal)
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let showLogOutMessageutton: UIButton = {
        let button = UIButton()
        button.setImage(.rightIcon, for: .normal)
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Puplic Properties

    var onEditButtonTapped: (() -> ())?

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureButtons()
        configureLabel()
        configureCALayers()
        selectionStyle = .none
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButtons()
        configureLabel()
        configureCALayers()
        selectionStyle = .none
    }

    // MARK: - Private Methods

    private func configureButtons() {
        contentView.addSubview(bonusesImageButton)
        contentView.addSubview(privacyTermsImageButton)
        contentView.addSubview(logOutImageButton)

        contentView.addSubview(showBonusesButton)
        contentView.addSubview(showPrivacyTermsButton)
        contentView.addSubview(showLogOutMessageutton)

        NSLayoutConstraint.activate([
            bonusesImageButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            bonusesImageButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            bonusesImageButton.widthAnchor.constraint(equalToConstant: 48),
            bonusesImageButton.heightAnchor.constraint(equalToConstant: 48),

            privacyTermsImageButton.topAnchor.constraint(equalTo: bonusesImageButton.bottomAnchor, constant: 20),
            privacyTermsImageButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            privacyTermsImageButton.widthAnchor.constraint(equalToConstant: 48),
            privacyTermsImageButton.heightAnchor.constraint(equalToConstant: 48),

            logOutImageButton.topAnchor.constraint(equalTo: privacyTermsImageButton.bottomAnchor, constant: 20),
            logOutImageButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            logOutImageButton.widthAnchor.constraint(equalToConstant: 48),
            logOutImageButton.heightAnchor.constraint(equalToConstant: 48),

            showBonusesButton.topAnchor.constraint(equalTo: bonusesImageButton.topAnchor, constant: 15),
            showBonusesButton.leftAnchor.constraint(equalTo: bonusesImageButton.rightAnchor, constant: 277),

            showPrivacyTermsButton.topAnchor.constraint(equalTo: privacyTermsImageButton.topAnchor, constant: 15),
            showPrivacyTermsButton.leftAnchor.constraint(equalTo: privacyTermsImageButton.rightAnchor, constant: 277),

            showLogOutMessageutton.topAnchor.constraint(equalTo: logOutImageButton.topAnchor, constant: 15),
            showLogOutMessageutton.leftAnchor.constraint(equalTo: logOutImageButton.rightAnchor, constant: 277),
        ])
    }

    private func configureLabel() {
        contentView.addSubview(bonusesLabel)
        contentView.addSubview(privacyTermsLabel)
        contentView.addSubview(logOutLabel)

        NSLayoutConstraint.activate([
            bonusesLabel.leftAnchor.constraint(equalTo: bonusesImageButton.rightAnchor, constant: 16),
            bonusesLabel.centerYAnchor.constraint(equalTo: bonusesImageButton.centerYAnchor),
            bonusesLabel.widthAnchor.constraint(equalToConstant: 224),
            bonusesLabel.heightAnchor.constraint(equalToConstant: 24),

            privacyTermsLabel.leftAnchor.constraint(equalTo: privacyTermsImageButton.rightAnchor, constant: 16),
            privacyTermsLabel.centerYAnchor.constraint(equalTo: privacyTermsImageButton.centerYAnchor),
            privacyTermsLabel.widthAnchor.constraint(equalToConstant: 224),
            privacyTermsLabel.heightAnchor.constraint(equalToConstant: 24),

            logOutLabel.leftAnchor.constraint(equalTo: logOutImageButton.rightAnchor, constant: 16),
            logOutLabel.centerYAnchor.constraint(equalTo: logOutImageButton.centerYAnchor),
            logOutLabel.widthAnchor.constraint(equalToConstant: 224),
            logOutLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    private func configureCALayers() {
        contentView.layer.addSublayer(bottomLineBonuses)
        contentView.layer.addSublayer(bottomLinePrivacyTerms)
        contentView.layer.addSublayer(bottomLineLogOut)
    }

    @objc private func showBonuses() {
        onEditButtonTapped?()
    }
}
