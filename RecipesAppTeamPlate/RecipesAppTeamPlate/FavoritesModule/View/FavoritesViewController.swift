// FavoritesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран избранных рецетов
class FavoritesViewController: UIViewController {
    // MARK: - Puplic Properties
    
    var presenter: FavoritesPresenter!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

// MARK: - FavoritesViewController + FavoritesViewProtocol
extension FavoritesViewController: FavoritesViewProtocol {}
