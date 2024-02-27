// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор главный
final class AppCoordinator: BaseCoordinator {
    private var tabBarController: RecipesTabBarController?

    override func start() {
        if "admin" == "admins" {
            toMain()
        } else {
            t​oAuth​()
        }
    }

    private func toMain() {
        tabBarController = RecipesTabBarController()

        /// Set Recipe
        let recipeModuleView = AppBuilder.makeRecipeModule()
        let recipeCoordinator = RecipeCoordinator(rootController: recipeModuleView)
        recipeModuleView.presenter?.recipesCoordinator = recipeCoordinator
        add(coordinator: recipeCoordinator)

        /// Set Favorites
        let favoritesModuleView = AppBuilder.makeFavoriteModule()
        let favoritesCoordinator = FavoritesCoordinator(rootController: favoritesModuleView)
        favoritesModuleView.presenter?.favoritesCoordinator = favoritesCoordinator
        add(coordinator: favoritesCoordinator)

        /// Set Profile
        let profileView = AppBuilder.makeProfileModule()
        let profileCoordinator = ProfileCoordinator(rootController: profileView)
        profileView.presenter?.profileCoordinator = profileCoordinator
        add(coordinator: profileCoordinator)

        profileCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: recipeCoordinator)
            self?.remove(coordinator: profileCoordinator)
            self?.tabBarController = nil
            self?.t​oAuth​()
        }

        tabBarController?.setViewControllers(
            [recipeCoordinator.rootController, favoritesCoordinator.rootController, profileCoordinator.rootController],
            animated: false
        )

        if let tabBarController = tabBarController {
            setAsRoot​(​_​: tabBarController)
        }
    }

    private func t​oAuth​() {
        let loginCoordinator = LoginCoordinator()
        loginCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: loginCoordinator)
            self?.toMain()
        }
        add(coordinator: loginCoordinator)
        loginCoordinator.start()
    }
}
