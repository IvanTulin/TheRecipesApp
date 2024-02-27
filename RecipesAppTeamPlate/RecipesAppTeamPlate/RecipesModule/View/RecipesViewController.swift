// RecipesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран рецептов
class RecipesViewController: UIViewController {
    var presenter: RecipesPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension RecipesViewController: RecipesViewProtocol {}
