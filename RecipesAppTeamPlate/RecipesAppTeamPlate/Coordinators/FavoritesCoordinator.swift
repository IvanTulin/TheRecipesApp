// FavoritesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор избранных рецептов
final class FavoritesCoordinator: BaseCoordinator {
    var rootController: UINavigationController
    var onFinishFlow: (() -> ())?

    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }

    func pushFavorites() {
        let favoritesViewController = FavoritesViewController()
        rootController.pushViewController(favoritesViewController, animated: true)
    }
}
