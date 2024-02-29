// FavoritesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор избранных рецептов
final class FavoritesCoordinator: BaseCoordinator {
    // MARK: - Puplic Properties

    var rootController: UINavigationController
    var onFinishFlow: (() -> ())?

    // MARK: - Initializers

    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }

    // MARK: - Public Methods

    func pushFavorites() {
        let favoritesViewController = FavoritesViewController()
        rootController.pushViewController(favoritesViewController, animated: true)
    }
}
