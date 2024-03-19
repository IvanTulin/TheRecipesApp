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

    // MARK: - Puplic Properties

    var recipes: RecipeCommonInfo?
    weak var recipesCoordinator: RecipeCoordinator?

    // MARK: - Private Properties

    private var detailRecipes: RecipeDetail?
    private var networkService = NetworkService()

    // MARK: - Initializers

    init(view: DetailRecipesViewProtocol) {
        detailRecipesView = view
        // getParseDetailRecipes()
    }

    // MARK: - Public Methods

    func getParseDetailRecipes() {
        networkService.getDetail(uri: recipes?.uri ?? "") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(details):
                self.detailRecipes = details
                if let detailRecipes = detailRecipes {
                    detailRecipesView?.getDetailRecipesNetwork(detail: detailRecipes)
                }
            case let .failure(failure):
                print(failure.localizedDescription)
            }
        }
    }

    func getDetailRecipes() {
        if let recipes = recipes, let detailRecipes = detailRecipes {
            detailRecipesView?.getDetailRecipes(detail: recipes)
            // detailRecipesView?.getDetailRecipesNetwork(detail: detailRecipes)
        }
    }

    func reloadData() {
        detailRecipesView?.reloadDataTableView()
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
