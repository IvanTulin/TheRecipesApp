// CalorieCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с количеством калорий
class CalorieCell: UITableViewCell {
    //    private let caloriesView: UIView = {
    //        let view = UIView()
    //        view.layer.cornerRadius = 16
    //        view.backgroundColor = .appCyan
    //        view.translatesAutoresizingMaskIntoConstraints = false
    //        return view
    //    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // configureCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // configureCell()
    }

    // MARK: - Public Methods

    func setupView() {
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

        var leftAnchors = 40
        for _ in 0 ... 3 {
            let caloriesView = UIView()
            caloriesView.layer.borderWidth = 2
            stackView.addSubview(caloriesView)
            caloriesView.layer.cornerRadius = 16
            caloriesView.backgroundColor = .cyan
            caloriesView.translatesAutoresizingMaskIntoConstraints = false

            caloriesView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            caloriesView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: CGFloat(leftAnchors))
                .isActive = true
            caloriesView.widthAnchor.constraint(equalToConstant: 74).isActive = true
            caloriesView.heightAnchor.constraint(equalToConstant: 53).isActive = true
            leftAnchors += 80
        }
    }

    // MARK: - Private Methods

    //    private func configureCell() {
    //        contentView.addSubview(caloriesView)
    //
    //        NSLayoutConstraint.activate([
    //            caloriesView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    //            caloriesView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 40),
    //            caloriesView.widthAnchor.constraint(equalToConstant: 74),
    //            caloriesView.heightAnchor.constraint(equalToConstant: 53)
    //        ])
    //    }

    // }
}
