// CategoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка категорий
class CategoriesCell: UICollectionViewCell {
    // MARK: - Constants

    enum Constants {
        static let nameFontName = "Verdana"
    }

    // MARK: - Visual Components

    lazy var salatImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 18
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.addShadow()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showRecipesViewController))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    let nameRecipesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: Constants.nameFontName, size: 20)
        label.textAlignment = .center
        label.layer.cornerRadius = 18
        label.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        label.backgroundColor = UIColor(
            red: 0.5,
            green: 0.5,
            blue: 0.5,
            alpha: 0.5
        )
        label.clipsToBounds = true
        return label
    }()

    // MARK: - Private Properties

    var buttonChangeHandler: VoidHandler?

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
        configureLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureImageView()
        configureLabel()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        salatImageView.image = nil
    }

    // MARK: - Public Methods

    func configureCell(_ info: RecipesInfo) {
        salatImageView.image = UIImage(named: info.nameRecipesImage)
        nameRecipesLabel.text = info.nameRecipesLabel
    }

    // MARK: - Private Methods

    private func configureImageView() {
        contentView.addSubview(salatImageView)

        NSLayoutConstraint.activate([
            salatImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            salatImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            salatImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            salatImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9)
        ])
    }

    private func configureLabel() {
        salatImageView.addSubview(nameRecipesLabel)
        NSLayoutConstraint.activate([
            nameRecipesLabel.leftAnchor.constraint(equalTo: salatImageView.leftAnchor),
            nameRecipesLabel.rightAnchor.constraint(equalTo: salatImageView.rightAnchor),
            nameRecipesLabel.bottomAnchor.constraint(equalTo: salatImageView.bottomAnchor),
            nameRecipesLabel.widthAnchor.constraint(equalToConstant: 250),
            nameRecipesLabel.heightAnchor.constraint(equalToConstant: 30)

        ])
    }

    @objc private func showRecipesViewController() {
        buttonChangeHandler?()
    }
}
