// RecipeDescriptionCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с описанием рецепта
class RecipeDescriptionCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let nameFontName = "Verdana"
    }

    // MARK: - Private Constants

    private let gradientDescribe: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.appLightBlue.cgColor,
            UIColor.white.cgColor
        ]
        gradient.cornerRadius = 24
        return gradient
    }()

    private let recipeLabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont(name: Constants.nameFontName, size: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        gradientDescribe.frame = rect
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            contentView.backgroundColor = .clear
        }
    }

    // MARK: - Public Methods

    func setupText(_ text: String) {
        // recipeDescriptionTextView.text = text
        recipeLabel.text = text
    }

//    func setupText(_ details: RecipeDetail) {
//        // recipeDescriptionTextView.text = text
//        recipeLabel.text = details.ingridientLines.first
//    }

    // MARK: - Private Methods

    private func configureCell() {
        contentView.layer.addSublayer(gradientDescribe)
        contentView.addSubview(recipeLabel)

        NSLayoutConstraint.activate([
            recipeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
            recipeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
            recipeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),
            recipeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
