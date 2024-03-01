// CategoryViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбранной категории
class CategoryViewController: UIViewController {
    // MARK: - Visual Components

    lazy var backButton: UIButton = {
        let customButton = UIButton(type: .custom)
        customButton.setImage(.backButton, for: .normal)
        customButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 28)
        customButton.setTitleColor(.black, for: .normal)
        customButton.addTarget(self, action: #selector(backToTheLastController), for: .touchUpInside)
        return customButton
    }()

    // MARK: - Puplic Properties

    var presenter: CategoryPresenter!
    var recipes: RecipesInfo?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tabBarController?.tabBar.isHidden = true
        // presenter.getTittle()
        configureNavigation()
        presenter.getRecipes()
        configureUI()
    }

    private func configureNavigation() {
        let customBarButtomItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBarButtomItem
    }

    private func configureUI() {
        //backButton.setTitle(recipes?.recipesInfo.first?.nameRecipesLabel, for: .normal)
        backButton.setTitle(recipes?.nameRecipesLabel, for: .normal)
    }

    @objc private func backToTheLastController() {
        print("Back")
        navigationController?.popViewController(animated: true)
    }
}

extension CategoryViewController: CategoryViewProtocol {
    func getRecipes(recipes: RecipesInfo) {
        self.recipes = recipes
    }

    func setTittle(_ nameTitle: String) {
        // backButton.setTitle(nameTitle, for: .normal)
    }
}
