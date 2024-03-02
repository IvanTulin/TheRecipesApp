// CategoryPresent.swift
// Copyright © RoadMap. All rights reserved.

/// Интерфейс общения с RecipesView
protocol CategoryViewProtocol: AnyObject {
    func setTittle(_ nameTitle: String)
    func getRecipes(recipes: RecipesInfo)
}

/// Интерфейс общения с RecipesPresenter
protocol CategoryViewPresenterProtocol: AnyObject {
    init(view: CategoryViewProtocol, source: RecipesInfo)

    func getTittle() -> String
}

/// Презентер Рецептов
final class CategoryPresenter: CategoryViewPresenterProtocol {
    // MARK: - Constants

    let categoryView: CategoryViewProtocol?
    var recipes: RecipesInfo

    // MARK: - Puplic Properties

    weak var recipesCoordinator: RecipeCoordinator?

    // MARK: - Initializers

    init(view: CategoryViewProtocol, source: RecipesInfo) {
        categoryView = view
        recipes = source
    }

    // MARK: - Public Methods

    func getTittle() -> String {
        "Fish"
        // categoryView.setTittle(nameTittle)
    }

    func getRecipes() {
        categoryView?.getRecipes(recipes: recipes)
    }
}
