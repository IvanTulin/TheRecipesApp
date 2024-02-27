// FavoritesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран избранных рецетов
class FavoritesViewController: UIViewController {
    var presenter: FavoritesPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension FavoritesViewController: FavoritesViewProtocol {}
