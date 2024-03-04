// FavoritesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с FavoritesView
protocol FavoritesViewProtocol: AnyObject {}

/// Интерфейс общения с FavoritesPresenter
protocol FavoritesViewPresenterProtocol: AnyObject {
    init(view: FavoritesViewProtocol, favorites: Favorites)
}

/// Презентер экрана избранного
final class FavoritesPresenter: FavoritesViewPresenterProtocol {
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
