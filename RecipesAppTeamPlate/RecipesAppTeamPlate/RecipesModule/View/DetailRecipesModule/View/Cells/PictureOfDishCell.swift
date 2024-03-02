// PictureOfDishCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с изображением блюда рецепта
class PictureOfDishCell: UITableViewCell {
    // MARK: - Visual Components

    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        // imageView.backgroundColor = .orange
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
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

    // MARK: - Public Methods

    func setupImage(_ image: String) {
        dishImageView.image = UIImage(named: image)
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
}
