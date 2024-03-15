// PictureOfDishCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с изображением блюда рецепта
class PictureOfDishCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let nameFontName = "Verdana"
        static let textForWeightLabel = "793 g"
        static let textForCookingTime = "Cooking time\n 60 min"
    }

    // MARK: - Visual Components

    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 0
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let weightOfTheDishView = {
        let view = UIView()
        view.backgroundColor = UIColor.appPaleBlue.withAlphaComponent(0.6)
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let cookingTimeView = {
        let view = UIView()
        view.backgroundColor = UIColor.appPaleBlue.withAlphaComponent(0.6)
        view.layer.cornerRadius = 24
        // view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        configureWeightOfTheDishView()
        createCookingTimeView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
        configureWeightOfTheDishView()
        createCookingTimeView()
    }

    // MARK: - Public Methods

//
//    func setupImage(_ image: String) {
//        dishImageView.image = UIImage(named: image)
//    }

//    func setupImage(_ image: RecipeCommonInfo) {
//        dishImageView.downloaded(from: image.image)
//    }

    func setupImage(_ image: RecipeDetail) {
        dishImageView.downloaded(from: image.images)
    }

    // MARK: - Private Methods

    private func configureCell() {
        contentView.addSubview(dishImageView)

        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dishImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 45),
            dishImageView.widthAnchor.constraint(equalToConstant: 300),
            dishImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    private func configureWeightOfTheDishView() {
        dishImageView.addSubview(weightOfTheDishView)

        let weightLabel = UILabel()
        weightOfTheDishView.addSubview(weightLabel)
        weightLabel.text = Constants.textForWeightLabel
        weightLabel.textColor = .white
        weightLabel.textAlignment = .center
        weightLabel.sizeToFit()
        weightLabel.font = UIFont(name: Constants.nameFontName, size: 10)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false

        let potImageView = UIImageView()
        weightOfTheDishView.addSubview(potImageView)
        potImageView.image = .pot
        potImageView.translatesAutoresizingMaskIntoConstraints = false
        potImageView.sizeToFit()

        NSLayoutConstraint.activate([
            weightOfTheDishView.topAnchor.constraint(equalTo: dishImageView.topAnchor, constant: 8),
            weightOfTheDishView.rightAnchor.constraint(equalTo: dishImageView.rightAnchor, constant: -14),
            weightOfTheDishView.widthAnchor.constraint(equalToConstant: 50),
            weightOfTheDishView.heightAnchor.constraint(equalToConstant: 50),

            potImageView.centerXAnchor.constraint(equalTo: weightOfTheDishView.centerXAnchor),
            potImageView.topAnchor.constraint(equalTo: weightOfTheDishView.topAnchor, constant: 7),

            weightLabel.centerXAnchor.constraint(equalTo: weightOfTheDishView.centerXAnchor),
            weightLabel.bottomAnchor.constraint(equalTo: weightOfTheDishView.bottomAnchor, constant: -6),

        ])
    }

    private func createCookingTimeView() {
        dishImageView.addSubview(cookingTimeView)

        let timerImageView = UIImageView()
        cookingTimeView.addSubview(timerImageView)
        timerImageView.image = .timer2
        timerImageView.tintColor = .white

        timerImageView.translatesAutoresizingMaskIntoConstraints = false

        let cookingTimeLabel = UILabel()
        cookingTimeView.addSubview(cookingTimeLabel)
        cookingTimeLabel.text = Constants.textForCookingTime
        cookingTimeLabel.textColor = .white
        cookingTimeLabel.textAlignment = .center
        cookingTimeLabel.sizeToFit()
        cookingTimeLabel.numberOfLines = 0
        cookingTimeLabel.font = UIFont(name: Constants.nameFontName, size: 10)
        cookingTimeLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cookingTimeView.bottomAnchor.constraint(equalTo: dishImageView.bottomAnchor),
            cookingTimeView.rightAnchor.constraint(equalTo: dishImageView.rightAnchor),
            cookingTimeView.widthAnchor.constraint(equalToConstant: 124),
            cookingTimeView.heightAnchor.constraint(equalToConstant: 48),

            timerImageView.centerYAnchor.constraint(equalTo: cookingTimeView.centerYAnchor),
            timerImageView.leftAnchor.constraint(equalTo: cookingTimeView.leftAnchor, constant: 8),
            timerImageView.widthAnchor.constraint(equalToConstant: 25),
            timerImageView.widthAnchor.constraint(equalToConstant: 25),

            cookingTimeLabel.centerYAnchor.constraint(equalTo: cookingTimeView.centerYAnchor),
            cookingTimeLabel.leftAnchor.constraint(equalTo: timerImageView.rightAnchor)
        ])
    }
}
