// FavoritesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с FavoritesView
protocol FavoritesViewProtocol: AnyObject {}

/// Интерфейс общения с FavoritesPresenter
protocol FavoritesViewPresenterProtocol: AnyObject {
    init(view: FavoritesViewProtocol, source: Favorites)
}

/// Презентер экрана избранного
class FavoritesPresenter: FavoritesViewPresenterProtocol {
    // MARK: - Constants
    
    let favoritesView: FavoritesViewProtocol
    let source: Favorites
    
    // MARK: - Puplic Properties
    
    weak var favoritesCoordinator: FavoritesCoordinator?

    //MARK: - Initializers
    
    required init(view: FavoritesViewProtocol, source: Favorites) {
        favoritesView = view
        self.source = source
    }
}
