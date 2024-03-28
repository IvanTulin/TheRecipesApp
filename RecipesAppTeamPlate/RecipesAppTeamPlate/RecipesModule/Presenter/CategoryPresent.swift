// CategoryPresent.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с RecipesPresenter
protocol CategoryViewPresenterProtocol: AnyObject {
    func getTittle() -> String
    func getRecipe()
//    func showDetails(_ details: RecipesStorage)
    func showDetails(_ details: RecipeCommonInfo)
    func getCommand()
    func restartShimmer()
}

/// Презентер Рецептов
final class CategoryPresenter: CategoryViewPresenterProtocol {
    // MARK: - Constants

    private let categoryView: CategoryViewProtocol?
    private var category: Category
    private var recipesNetwork: [RecipeCommonInfo]?
    private var networkService = NetworkService()
    private weak var recipesCoordinator: RecipeCoordinator?

    // MARK: - Puplic Properties

    var state: ViewState<RecipeCommonInfo> = .loading {
        didSet {
            categoryView?.updateStateView()
        }
    }

    // MARK: - Initializers

    init(
        categoryView: CategoryViewProtocol,
        category: Category,
        recipesCoordinator: RecipeCoordinator
    ) {
        self.categoryView = categoryView
        self.category = category
        self.recipesCoordinator = recipesCoordinator
        parseRecipes()
    }

    // MARK: - Public Methods

    func getTittle() -> String {
        "Fish"
        // categoryView.setTittle(nameTittle)
    }

    func parseRecipes() {
        networkService.getRecipe(type: category.categoryTitle) { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case let .success(recipes):
                    self.recipesNetwork = recipes
                    self.categoryView?.getRecipes(recipes: self.recipesNetwork ?? [])
                case .failure:
                    break
                }
            }
        }
    }

    func getRecipe() {
        categoryView?.getRecipes(recipes: recipesNetwork ?? [])
    }

//    func showDetails(_ details: RecipesStorage) {
//        recipesCoordinator?.showDetailRecipesViewController(details: details)
//    }

    func showDetails(_ details: RecipeCommonInfo) {
        recipesCoordinator?.showDetailRecipesViewController(details: details)
    }

    func getCommand() {
        categoryView?.sendCommand()
    }

    func restartShimmer() {
        categoryView?.launchShimmer()
    }
}
