// AppBuilder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол билдер
protocol Builder {
    static func makeRecipeModule() -> RecipesViewController
    static func makeFavoriteModule() -> FavoritesViewController
    static func makeProfileModule(coordinator: ProfileCoordinator) -> ProfileViewController
    static func createBonusesProfileModule() -> UIViewController
}

/// Класс билдер
final class AppBuilder: Builder {
    enum Constants {
        static let titleRecipes = "Recipes"
        static let titleFavorites = "Favorites"
        static let titleProfile = "Profile"
    }

    // MARK: - Public Methods

    static func makeLoginModule() -> LoginViewController {
        let loginSource = Login()
        let view = LoginViewController()
        let presenter = LoginPresenter(view: view)
        view.autorizationPresenter = presenter
        return view
    }

    static func makeRecipeModule() -> RecipesViewController {
        let recipesSource = Recipes()
        let view = RecipesViewController()
        let recipePresenter = RecipesPresenter(view: view, source: recipesSource)
        view.presenter = recipePresenter
        view.tabBarItem = UITabBarItem(title: Constants.titleRecipes, image: .recipecIcon, tag: 0)
        return view
    }

    static func makeFavoriteModule() -> FavoritesViewController {
        let favoritesSource = Favorites()
        let view = FavoritesViewController()
        let favoritesPresenter = FavoritesPresenter(view: view, source: favoritesSource)
        view.presenter = favoritesPresenter
        view.tabBarItem = UITabBarItem(title: Constants.titleFavorites, image: .favoriteIcon, tag: 0)
        return view
    }

    static func makeProfileModule(coordinator: ProfileCoordinator) -> ProfileViewController {
        let view = ProfileViewController()
        let infoSource = InfoSource()
        let profilePresenter = ProfilePresenter(view: view, coordinator: coordinator)
        profilePresenter.infoSource = infoSource
        view.presenter = profilePresenter
        view.tabBarItem = UITabBarItem(title: Constants.titleProfile, image: .profile, tag: 1)
        return view
    }

    static func createBonusesProfileModule() -> UIViewController {
        let view = BonusesViewController()
        let infoSource = InfoSource()
        let presenter = ProfileBonusesPresenter(view: view, infoSource: infoSource)
        view.presenter = presenter
        return view
    }
}
