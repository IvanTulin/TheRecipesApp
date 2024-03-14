// CalorieCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с количеством калорий
class CalorieCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let textForEnercKcal = "EnercKcal"
        static let textNumberCalories = "1322 kcal"
        static let textForCarbohydrates = "Carbohydrates"
        static let textNumberGrammForCarbohydrates = "10,78 g"
        static let textForFats = "Fats"
        static let textNumberGrammFats = "10,00 g"
        static let textForProteins = "Proteins"
        static let textNumberGrammProteins = "97,30 g"
        static let nameFontName = "Verdana"
    }

    let nameNutrientViews = [
        Constants.textForEnercKcal,
        Constants.textForCarbohydrates,
        Constants.textForFats, Constants.textForProteins
    ]

    let numberNutrientViews = [
        Constants.textNumberCalories,
        Constants.textNumberGrammForCarbohydrates,
        Constants.textNumberGrammFats,
        Constants.textNumberGrammProteins
    ]

    // MARK: - Visual Components

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Private Properties

    private var leftAnchors = 40

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

//    func setupView(_ details: RecipeDetail) {
//        contentView.addSubview(stackView)
//
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
//            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
//            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//        ])
//
//        for (index, item) in nameNutrientViews.enumerated() {
//            let caloriesView = UIView()
//            caloriesView.layer.borderWidth = 2
//            caloriesView.layer.borderColor = UIColor.appPaleBlue.cgColor
//            stackView.addSubview(caloriesView)
//            caloriesView.layer.cornerRadius = 16
//            caloriesView.backgroundColor = .appPaleBlue
//            caloriesView.translatesAutoresizingMaskIntoConstraints = false
//
//            let captionLabel = UILabel()
//            caloriesView.addSubview(captionLabel)
//            captionLabel.text = item
//            captionLabel.textColor = .white
//            captionLabel.textAlignment = .center
//            captionLabel.font = UIFont(name: Constants.nameFontName, size: 10)
//            captionLabel.backgroundColor = .appPaleBlue
//            captionLabel.translatesAutoresizingMaskIntoConstraints = false
//
//            let valueLabel = UILabel()
//            caloriesView.addSubview(valueLabel)
//            valueLabel.text = numberNutrientViews[index]
//            valueLabel.textColor = .appPaleBlue
//            valueLabel.textAlignment = .center
//            valueLabel.font = UIFont(name: Constants.nameFontName, size: 10)
//            valueLabel.backgroundColor = .white
//            valueLabel.translatesAutoresizingMaskIntoConstraints = false
//
//            addConstrints(view: caloriesView, caption: captionLabel, value: valueLabel)
//        }
//    }

    func setupView() {
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

        for (index, item) in nameNutrientViews.enumerated() {
            let caloriesView = UIView()
            caloriesView.layer.borderWidth = 2
            caloriesView.layer.borderColor = UIColor.appPaleBlue.cgColor
            stackView.addSubview(caloriesView)
            caloriesView.layer.cornerRadius = 16
            caloriesView.backgroundColor = .appPaleBlue
            caloriesView.translatesAutoresizingMaskIntoConstraints = false

            let captionLabel = UILabel()
            caloriesView.addSubview(captionLabel)
            captionLabel.text = item
            captionLabel.textColor = .white
            captionLabel.textAlignment = .center
            captionLabel.font = UIFont(name: Constants.nameFontName, size: 10)
            captionLabel.backgroundColor = .appPaleBlue
            captionLabel.translatesAutoresizingMaskIntoConstraints = false

            let valueLabel = UILabel()
            caloriesView.addSubview(valueLabel)
            valueLabel.text = numberNutrientViews[index]
            valueLabel.textColor = .appPaleBlue
            valueLabel.textAlignment = .center
            valueLabel.font = UIFont(name: Constants.nameFontName, size: 10)
            valueLabel.backgroundColor = .white
            valueLabel.translatesAutoresizingMaskIntoConstraints = false

            addConstrints(view: caloriesView, caption: captionLabel, value: valueLabel)
        }
    }

    private func addConstrints(view: UIView, caption: UILabel, value: UILabel) {
        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: CGFloat(leftAnchors)),
            view.widthAnchor.constraint(equalToConstant: 74),
            view.heightAnchor.constraint(equalToConstant: 53),

            caption.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            caption.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            caption.widthAnchor.constraint(equalToConstant: 70),
            caption.heightAnchor.constraint(equalToConstant: 20),

            value.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            value.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            value.widthAnchor.constraint(equalToConstant: 74),
            value.heightAnchor.constraint(equalToConstant: 20),
        ])

        leftAnchors += 80
    }
}
