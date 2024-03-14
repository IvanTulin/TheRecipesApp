// DetailRecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с DetailRecipesPresenter
protocol DetailRecipesProtocol {
    // func getDetailRecipes()
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
    private var detailsrRecipeNetwork: RecipeDetail?
    private var networkService = NetworkService()

    // MARK: - Puplic Properties

    weak var recipesCoordinator: RecipeCoordinator?

    // MARK: - Initializers

    init(view: DetailRecipesViewProtocol) {
        detailRecipesView = view
        parseDetailsRecipes()
    }

    // MARK: - Public Methods

//    func parseDetailsRecipes() {
//        networkService.getDetail(
//            uri: detailRecipes?.uri ?? ""
//        ) { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case let .success(detailsRecipes):
//                self.detailsrRecipeNetwork = detailsRecipes
//                if let detailsRecipes = detailsrRecipeNetwork {
//                    self.detailRecipesView?.getDetailRecipes(detail: detailsRecipes)
//                }
//            case let .failure(failure):
//                print(failure.localizedDescription)
//            }
//        }
//    }

    func parseDetailsRecipes() {
        if let uri = detailRecipes {
            networkService.getDetail(uri: uri.uri) { [weak self] result in
                guard let self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case let .success(recipes):
                        self.detailsrRecipeNetwork = recipes
                        if let detailsRecipes = self.detailsrRecipeNetwork {
                            self.detailRecipesView?.getDetailRecipesNetwork(detail: detailsRecipes)
                            print("detailRecipes \(self.detailRecipes)")
                        }
                    case .failure:
                        break
                    }
                }
            }
        }
    }

    func getDetailRecipes() {
        if let detail = detailsrRecipeNetwork {
            detailRecipesView?.getDetailRecipesNetwork(detail: detail)
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
