// AppBuilder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол билдер
protocol Builder {
    static func makeRecipeModule() -> RecipesViewController
    static func makeFavoriteModule() -> FavoritesViewController
    static func makeProfileModule(coordinator: ProfileCoordinator) -> ProfileViewController
}

/// Класс билдер
final class AppBuilder: Builder {
    static func makeRecipeModule() -> RecipesViewController {
        let recipesSource = Recipes()
        let view = RecipesViewController()
        let recipePresenter = RecipesPresenter(view: view, source: recipesSource)
        view.presenter = recipePresenter
        view.tabBarItem = UITabBarItem(title: "Recipe", image: .recipecIcon, tag: 0)
        return view
    }

    static func makeFavoriteModule() -> FavoritesViewController {
        let favoritesSource = Favorites()
        let view = FavoritesViewController()
        let favoritesPresenter = FavoritesPresenter(view: view, source: favoritesSource)
        view.presenter = favoritesPresenter
        view.tabBarItem = UITabBarItem(title: "Favorites", image: .favoriteIcon, tag: 0)
        return view
    }

    static func makeProfileModule(coordinator: ProfileCoordinator) -> ProfileViewController {
        let view = ProfileViewController()
        let infoSource = InfoSource()
        let profilePresenter = ProfilePresenter(view: view, coordinator: coordinator)
        profilePresenter.infoSource = infoSource
        view.presenter = profilePresenter
        view.tabBarItem = UITabBarItem(title: "Profile", image: .profile, tag: 1)
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
