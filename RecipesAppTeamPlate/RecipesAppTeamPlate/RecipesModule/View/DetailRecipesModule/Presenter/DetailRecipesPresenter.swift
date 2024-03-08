// DetailRecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с DetailRecipesPresenter
protocol DetailRecipesProtocol {
    /// Получить данные рецепта
    func getDetailRecipes()
    /// Получить текст для титла
    func getTextForTittle()
}

final class DetailRecipesPresenter: DetailRecipesProtocol {
    // MARK: - Constants

    let detailRecipesView: DetailRecipesViewProtocol?
    var detailRecipes: RecipesStorage?

    // MARK: - Puplic Properties

    weak var recipesCoordinator: RecipeCoordinator?

    // MARK: - Initializers

    init(view: DetailRecipesViewProtocol) {
        detailRecipesView = view
    }

    func getDetailRecipes() {
        if let detail = detailRecipes {
            detailRecipesView?.getDetailRecipes(detail: detail)
        }
    }

    func getTextForTittle() {
        detailRecipesView?.setTittle()
    }
}
