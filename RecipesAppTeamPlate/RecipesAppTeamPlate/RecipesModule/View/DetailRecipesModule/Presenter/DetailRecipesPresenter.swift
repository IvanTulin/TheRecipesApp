// DetailRecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol DetailRecipesViewProtocol: AnyObject {
    ///  Презентер экрана
    var presenter: DetailRecipesPresenter? { get set }

    func getDetailRecipes(detail: RecipesStorage)
}

protocol DetailRecipesProtocol {}

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
}
