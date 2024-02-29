// CategoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка категорий
class CategoriesCell: UICollectionViewCell {
    private let salatImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 18
        imageView.backgroundColor = .orange
        imageView.layer.borderWidth = 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureImageView()
    }

    private func configureImageView() {
        contentView.addSubview(salatImageView)

        NSLayoutConstraint.activate([
            salatImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            salatImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            salatImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            salatImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9)

        ])
    }
}
