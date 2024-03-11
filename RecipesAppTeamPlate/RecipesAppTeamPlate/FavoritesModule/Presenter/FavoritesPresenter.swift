// FavoritesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с FavoritesView
protocol FavoritesViewProtocol: AnyObject {
    func showImage()
    func showTableView(favoriteRecipes: [RecipesStorage])
}

/// Интерфейс общения с FavoritesPresenter
protocol FavoritesViewPresenterProtocol: AnyObject {
    func checkFavorite()
    init(view: FavoritesViewProtocol, favorites: Favorites)
}

/// Презентер экрана избранного
final class FavoritesPresenter: FavoritesViewPresenterProtocol {
    func checkFavorite() {
        let service = FavoriteService.service
        if service.favoriteRecipes.isEmpty {
            favoritesView.showImage()
        } else {
            favoritesView.showTableView(favoriteRecipes: service.favoriteRecipes)
        }
        service.save()
    }

    // MARK: - Constants

    let favoritesView: FavoritesViewProtocol
    let favorites: Favorites

    // MARK: - Puplic Properties

    weak var favoritesCoordinator: FavoritesCoordinator?

    // MARK: - Initializers

    required init(view: FavoritesViewProtocol, favorites: Favorites) {
        favoritesView = view
        self.favorites = favorites
    }
}
