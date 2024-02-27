// FavoritesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol FavoritesViewProtocol: AnyObject {}

protocol FavoritesViewPresenterProtocol: AnyObject {
    init(view: FavoritesViewProtocol, source: Favorites)
}

/// Презентер экрана избранного
class FavoritesPresenter: FavoritesViewPresenterProtocol {
    weak var favoritesCoordinator: FavoritesCoordinator?
    let favoritesView: FavoritesViewProtocol
    let source: Favorites

    required init(view: FavoritesViewProtocol, source: Favorites) {
        favoritesView = view
        self.source = source
    }
}
