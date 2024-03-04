// AppBuilder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол билдер
protocol BuilderProtocol {
    /// создаем экран Рецептов
    static func makeRecipeModule(coordinator: RecipeCoordinator) -> RecipesViewController
    // static func createCategoryModule() -> CategoryViewController
    /// создаем экран Избранных
    static func makeFavoriteModule() -> FavoritesViewController
    /// создаем экран Профиля
    static func makeProfileModule(coordinator: ProfileCoordinator) -> ProfileViewController
    /// создаем экран Бонусов
    static func createBonusesProfileModule() -> UIViewController
}

/// Билдер
final class AppBuilder: BuilderProtocol {
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

    static func makeRecipeModule(coordinator: RecipeCoordinator) -> RecipesViewController {
        let recipesSource = Recipes()
        let view = RecipesViewController()
        let recipePresenter = RecipesPresenter(view: view, coordinator: coordinator)
        recipePresenter.source = recipesSource
        view.presenter = recipePresenter
        view.tabBarItem = UITabBarItem(title: Constants.titleRecipes, image: .recipecIcon, tag: 0)
        return view
    }

    static func makeFavoriteModule() -> FavoritesViewController {
        let favoritesSource = Favorites()
        let view = FavoritesViewController()
        let favoritesPresenter = FavoritesPresenter(view: view, favorites: favoritesSource)
        view.presenter = favoritesPresenter
        view.tabBarItem = UITabBarItem(title: Constants.titleFavorites, image: .favoriteIcon, tag: 0)
        return view
    }

    static func makeProfileModule(coordinator: ProfileCoordinator) -> ProfileViewController {
        let view = ProfileViewController()
        let profileInfo = ProfileInfo()
        let profilePresenter = ProfilePresenter(view: view, coordinator: coordinator)
        profilePresenter.profileInfo = profileInfo
        view.presenter = profilePresenter
        view.tabBarItem = UITabBarItem(title: Constants.titleProfile, image: .profile, tag: 1)
        return view
    }

    static func createBonusesProfileModule() -> UIViewController {
        let view = BonusesViewController()
        let infoSource = ProfileInfo()
        let presenter = ProfileBonusesPresenter(view: view, infoSource: infoSource)
        view.presenter = presenter
        return view
    }

    static func createDetailRecipesModule() -> DetailRecipesViewController {
        let detailRecipesViewController = DetailRecipesViewController()
        let presenter = DetailRecipesPresenter(view: detailRecipesViewController)
        detailRecipesViewController.presenter = presenter
        return detailRecipesViewController
    }
}
