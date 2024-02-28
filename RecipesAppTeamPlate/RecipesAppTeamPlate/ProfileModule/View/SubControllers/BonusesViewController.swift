// BonusesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран бонусов
class BonusesViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let textForUserName = "Your bonuses"
        static let textFornumberOfBonuses = "100"
        static let nameFontBold = "Verdana-Bold"
    }

    // MARK: - Visual Components

    private let closedButton: UIButton = {
        let button = UIButton()
        button.setImage(.crossIcon, for: .normal)
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let yourBonuseslabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForUserName
        label.textAlignment = .center
        label.font = UIFont(name: Constants.nameFontBold, size: 20)
        label.textColor = .darkGray
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let numberOfBonuseslabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textFornumberOfBonuses
        label.textAlignment = .center
        label.font = UIFont(name: Constants.nameFontBold, size: 30)
        label.textColor = .darkGray
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bonusesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bonuses
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .goldStar
        imageView.sizeToFit()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureButton()
        configureLabel()
        configureImageView()
    }

    private func configureUI() {
        view.backgroundColor = .white
    }

    private func configureButton() {
        view.addSubview(closedButton)

        NSLayoutConstraint.activate([
            closedButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            closedButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 351)
        ])
    }

    private func configureLabel() {
        view.addSubview(yourBonuseslabel)
        view.addSubview(numberOfBonuseslabel)

        NSLayoutConstraint.activate([
            yourBonuseslabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
            yourBonuseslabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            numberOfBonuseslabel.topAnchor.constraint(equalTo: yourBonuseslabel.bottomAnchor, constant: 177),
            numberOfBonuseslabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 187)
        ])
    }

    private func configureImageView() {
        view.addSubview(bonusesImageView)
        view.addSubview(starImageView)

        NSLayoutConstraint.activate([
            bonusesImageView.topAnchor.constraint(equalTo: yourBonuseslabel.bottomAnchor, constant: 13),
            bonusesImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bonusesImageView.widthAnchor.constraint(equalToConstant: 150),
            bonusesImageView.heightAnchor.constraint(equalToConstant: 136),

            starImageView.topAnchor.constraint(equalTo: bonusesImageView.bottomAnchor, constant: 31),
            starImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 144),
        ])
    }
}
