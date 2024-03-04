// RecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с RecipesView
protocol RecipesViewProtocol: AnyObject {}

/// Интерфейс общения с RecipesPresenter
protocol RecipesViewPresenterProtocol: AnyObject {
    func getUserInformation() -> [RecipesInfo]?
    func showCategory(_ type: RecipesInfo)
}

/// Презентер Рецептов
final class RecipesPresenter: RecipesViewPresenterProtocol {
    // MARK: - Constants

    let recipesView: RecipesViewProtocol
    var source: Recipes?

    // MARK: - Puplic Properties

    private weak var recipesCoordinator: RecipeCoordinator?

    // MARK: - Initializers

    init(view: RecipesViewProtocol, coordinator: RecipeCoordinator) {
        recipesView = view
        recipesCoordinator = coordinator
    }

    // MARK: - Public Methods

    func getUserInformation() -> [RecipesInfo]? {
        source?.getUserInfo()
    }

    func showCategory(_ type: RecipesInfo) {
        recipesCoordinator?.showCategories(category: type)
    }
}
