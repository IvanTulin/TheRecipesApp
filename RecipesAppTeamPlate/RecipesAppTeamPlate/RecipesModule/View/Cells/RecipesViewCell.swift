// RecipesViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// cell for Fish
final class RecipesViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let font = "Verdana"
        static let sizeFont = 14
        static let labelSize = 12
        static let cellColor = "recipeCellColor"
    }

    // MARK: - Visual Components

    private lazy var intoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: Constants.cellColor)
        view.layer.cornerRadius = 12
        return view
    }()

    private let title: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        text.font = UIFont(name: Constants.font, size: CGFloat(Constants.sizeFont))
        return text
    }()

    private let hardwareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "iconHardware"), for: .normal)
        return button
    }()

    private let dishImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let timerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "timer")
        return image
    }()

    private let pizzaImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pizza")
        return image
    }()

    private let dishTime: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.font = UIFont(name: Constants.font, size: CGFloat(Constants.labelSize))
        return text
    }()

    private let dishKkal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: Constants.font, size: CGFloat(Constants.labelSize))
        return label
    }()

    // MARK: - Public Methods

    func getRecipes(recipe: RecipesStorage) {
        selectionStyle = .none
        title.text = recipe.dishLabel
        dishImage.image = UIImage(named: recipe.dishImage)
        dishTime.text = recipe.dishTime
        dishKkal.text = recipe.dishKkal
        // intoView.addSubview(searchBar)
        intoView.addSubview(title)
        contentView.addSubview(intoView)
        intoView.addSubview(dishImage)
        intoView.addSubview(timerImage)
        intoView.addSubview(pizzaImage)
        intoView.addSubview(dishTime)
        intoView.addSubview(dishKkal)
        intoView.addSubview(hardwareButton)
        setupIntoView()
        setupTitleLabel()
        setupDishImage()
        setupTimerImage()
        setupPizzaImage()
        setupDishTime()
        setupDishKkal()
        setupHardwareButton()
    }

    // MARK: - Private Methods

    private func setupIntoView() {
        intoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7).isActive = true
        intoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        intoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        intoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true
    }

    private func setupHardwareButton() {
        hardwareButton.trailingAnchor.constraint(equalTo: intoView.trailingAnchor, constant: -5).isActive = true
        hardwareButton.topAnchor.constraint(equalTo: intoView.topAnchor, constant: 30)
            .isActive = true
        hardwareButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        hardwareButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setupTitleLabel() {
        title.trailingAnchor.constraint(equalTo: intoView.trailingAnchor, constant: -30).isActive = true
        title.topAnchor.constraint(equalTo: intoView.topAnchor, constant: 10).isActive = true
        title.widthAnchor.constraint(equalToConstant: 210).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setupDishImage() {
        dishImage.topAnchor.constraint(equalTo: intoView.topAnchor, constant: 10).isActive = true
        dishImage.trailingAnchor.constraint(equalTo: intoView.trailingAnchor, constant: -250).isActive = true
        dishImage.bottomAnchor.constraint(equalTo: intoView.bottomAnchor, constant: -10).isActive = true
        dishImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        dishImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupTimerImage() {
        timerImage.leadingAnchor.constraint(equalTo: intoView.leadingAnchor, constant: 100).isActive = true
        timerImage.bottomAnchor.constraint(equalTo: intoView.bottomAnchor, constant: -20).isActive = true
        timerImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        timerImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setupPizzaImage() {
        pizzaImage.trailingAnchor.constraint(equalTo: intoView.trailingAnchor, constant: -144).isActive = true
        pizzaImage.centerYAnchor.constraint(equalTo: timerImage.centerYAnchor).isActive = true
        pizzaImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        pizzaImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setupDishTime() {
        dishTime.leadingAnchor.constraint(equalTo: intoView.leadingAnchor, constant: 120).isActive = true
        dishTime.centerYAnchor.constraint(equalTo: timerImage.centerYAnchor).isActive = true
        dishTime.widthAnchor.constraint(equalToConstant: 55).isActive = true
        dishTime.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setupDishKkal() {
        dishKkal.trailingAnchor.constraint(equalTo: intoView.trailingAnchor, constant: -88).isActive = true
        dishKkal.centerYAnchor.constraint(equalTo: pizzaImage.centerYAnchor).isActive = true
        dishKkal.heightAnchor.constraint(equalToConstant: 15).isActive = true
        dishKkal.widthAnchor.constraint(equalToConstant: 55).isActive = true
    }
}
