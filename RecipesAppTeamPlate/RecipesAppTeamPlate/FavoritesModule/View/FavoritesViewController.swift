// FavoritesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран избранных рецетов
final class FavoritesViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let favoritesLabel = "Favorites"
        static let font = "Verdana-Bold"
        static let maxSize = 28
        static let emptyView = "EmptyView"
    }

    // MARK: - Visual Components

    private let favoritesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.font, size: CGFloat(Constants.maxSize))
        label.text = Constants.favoritesLabel
        return label
    }()

    private let emptyView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Constants.emptyView)
        return image
    }()

    // MARK: - Puplic Properties

    var presenter: FavoritesPresenter!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(favoritesLabel)
        view.addSubview(emptyView)
        setupFavoritesLabel()
        setupEmptyView()
    }

    // MARK: - Private Methods

    private func setupFavoritesLabel() {
        favoritesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        favoritesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        favoritesLabel.widthAnchor.constraint(equalToConstant: 175).isActive = true
        favoritesLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func setupEmptyView() {
        emptyView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        emptyView.heightAnchor.constraint(equalToConstant: 132).isActive = true
    }
}

// MARK: - FavoritesViewController + FavoritesViewProtocol

extension FavoritesViewController: FavoritesViewProtocol {}
