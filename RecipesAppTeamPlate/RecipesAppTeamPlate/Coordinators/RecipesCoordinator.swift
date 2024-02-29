// RecipesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор рецептов
final class RecipeCoordinator: BaseCoordinator {
    // MARK: - Puplic Properties

    var rootController: UINavigationController
    var onFinishFlow: (() -> ())?

    // MARK: - Initializers

    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }

    // MARK: - Public Methods

    func pushRecipes() {
        let recipeViewController = RecipesViewController()
        rootController.pushViewController(recipeViewController, animated: true)
    }
}
