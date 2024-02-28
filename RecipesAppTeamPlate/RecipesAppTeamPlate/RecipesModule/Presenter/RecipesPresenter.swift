// RecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с RecipesView
protocol RecipesViewProtocol: AnyObject {}

/// Интерфейс общения с RecipesPresenter
protocol RecipesViewPresenterProtocol: AnyObject {
    init(view: RecipesViewProtocol, source: Recipes)
}

/// Презентер Рецептов
class RecipesPresenter: RecipesViewPresenterProtocol {
    // MARK: - Constants

    let recipesView: RecipesViewProtocol
    let source: Recipes

    // MARK: - Puplic Properties

    weak var recipesCoordinator: RecipeCoordinator?

    // MARK: - Initializers

    required init(view: RecipesViewProtocol, source: Recipes) {
        recipesView = view
        self.source = source
    }
}
