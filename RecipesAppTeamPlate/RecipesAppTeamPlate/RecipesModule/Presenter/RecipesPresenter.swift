// RecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol RecipesViewProtocol: AnyObject {}

protocol RecipesViewPresenterProtocol: AnyObject {
    init(view: RecipesViewProtocol, source: Recipes)
}

/// Презентер Рецептов
class RecipesPresenter: RecipesViewPresenterProtocol {
    weak var recipesCoordinator: RecipeCoordinator?

    let recipesView: RecipesViewProtocol
    let source: Recipes

    required init(view: RecipesViewProtocol, source: Recipes) {
        recipesView = view
        self.source = source
    }
}
