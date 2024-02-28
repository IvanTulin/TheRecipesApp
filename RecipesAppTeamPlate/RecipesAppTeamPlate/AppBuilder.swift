// AppBuilder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол билдер
protocol Builder {
    static func makeLoginModule() -> LoginViewController
    static func makeRecipeModule() -> RecipesViewController
    static func makeFavoriteModule() -> FavoritesViewController
    static func makeProfileModule() -> ProfileViewController
}

/// Класс билдер
class AppBuilder: Builder {
    static func makeLoginModule() -> LoginViewController {
        let loginSource = Login()
        let view = LoginViewController()
        let presenter = LoginPresenter(view: view, source: loginSource)
        view.presenter = presenter
        return view
    }

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

    static func makeProfileModule() -> ProfileViewController {
        let profileSource = Profile(userName: "")
        let view = ProfileViewController()
        let profilePresenter = ProfilePresenter(view: view, source: profileSource)
        view.presenter = profilePresenter
        view.tabBarItem = UITabBarItem(title: "Profile", image: .profile, tag: 1)
        return view
    }
}
