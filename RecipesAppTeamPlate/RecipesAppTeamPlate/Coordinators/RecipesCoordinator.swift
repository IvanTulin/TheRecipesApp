// RecipesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор рецептов
final class RecipeCoordinator: BaseCoordinator {
    // MARK: - Puplic Properties

    var rootController: UINavigationController?
    var onFinishFlow: VoidHandler?

    // MARK: - Initializers

    func setRootViewController(view: UIViewController) {
        rootController = UINavigationController(
            rootViewController: view
        )
    }

    // MARK: - Public Methods

    func showRecipes() {
        let recipeViewController = RecipesViewController()
        // let recipeViewController = AppBuilder.makeRecipeModule()
        rootController?.pushViewController(recipeViewController, animated: true)
    }

    func showCategories(category: RecipesInfo) {
        let categoryViewController = CategoryViewController()
        let presenter = CategoryPresenter(view: categoryViewController, source: category)
        categoryViewController.presenter = presenter
        rootController?.pushViewController(categoryViewController, animated: true)
    }
}
