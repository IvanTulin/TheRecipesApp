// FavoritesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор избранных рецептов
final class FavoritesCoordinator: BaseCoordinator {
    // MARK: - Puplic Properties

    var rootController: UINavigationController
    var onFinishFlow: VoidHandler?

    // MARK: - Initializers

    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }

    // MARK: - Public Methods

    func showFavoritesModule() {
        let favoritesViewController = FavoritesViewController()
        rootController.pushViewController(favoritesViewController, animated: true)
    }
}
