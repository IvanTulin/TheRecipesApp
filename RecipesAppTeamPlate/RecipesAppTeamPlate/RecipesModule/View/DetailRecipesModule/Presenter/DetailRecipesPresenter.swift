// DetailRecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с DetailRecipesPresenter
protocol DetailRecipesProtocol {
    /// Получить данные рецепта
    func getDetailRecipes()
    /// Получить текст для титла
    func getTextForTittle()
    /// Отправить команду для контролллера
    func getCommand()
    /// Отправить команду для отправки рецепта
    func getCommandForShare()
}

final class DetailRecipesPresenter: DetailRecipesProtocol {
    // MARK: - Constants

    let detailRecipesView: DetailRecipesViewProtocol?
    var detailRecipes: RecipeCommonInfo?

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

    func getCommand() {
        detailRecipesView?.sendCommand()
    }

    func getCommandForShare() {
        detailRecipesView?.sendCommandForShare()
    }
}
