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

    func showCategories(category: Category) {
        let categoryViewController = CategoryViewController()
        let presenter = CategoryPresenter(
            categoryView: categoryViewController,
            category: category,
            recipesCoordinator: self
        )
        categoryViewController.presenter = presenter
        rootController?.pushViewController(categoryViewController, animated: true)
    }

    func showDetailRecipesViewController(details: RecipeCommonInfo) {
        let detailRecipesViewController = AppBuilder.createDetailRecipesModule()
        detailRecipesViewController.presenter?.detailRecipes = details
        detailRecipesViewController.presenter?.recipesCoordinator = self
        rootController?.pushViewController(detailRecipesViewController, animated: true)
    }
}
