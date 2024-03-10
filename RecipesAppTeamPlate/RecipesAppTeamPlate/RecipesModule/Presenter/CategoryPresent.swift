// CategoryPresent.swift
// Copyright © RoadMap. All rights reserved.

/// Интерфейс общения с RecipesPresenter
protocol CategoryViewPresenterProtocol: AnyObject {
    func getTittle() -> String
    func getRecipes()
    func showDetails(_ details: RecipesStorage)
    func getCommand()
}

/// Презентер Рецептов
final class CategoryPresenter: CategoryViewPresenterProtocol {
    // MARK: - Constants

    private let categoryView: CategoryViewProtocol?
    private var recipes: RecipesInfo

    // MARK: - Puplic Properties

    private weak var recipesCoordinator: RecipeCoordinator?

    // MARK: - Initializers

    init(categoryView: CategoryViewProtocol, recipes: RecipesInfo, recipesCoordinator: RecipeCoordinator) {
        self.categoryView = categoryView
        self.recipes = recipes
        self.recipesCoordinator = recipesCoordinator
    }

    // MARK: - Public Methods

    func getTittle() -> String {
        "Fish"
        // categoryView.setTittle(nameTittle)
    }

    func getRecipes() {
        categoryView?.getRecipes(recipes: recipes)
    }

    func showDetails(_ details: RecipesStorage) {
        recipesCoordinator?.showDetailRecipesViewController(details: details)
    }

    func getCommand() {
        categoryView?.sendCommand()
    }
}
