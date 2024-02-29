// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор главный
final class AppCoordinator: BaseCoordinator {
    // MARK: - Private Properties

    private var tabBarController: UITabBarController?

    // MARK: - Public Methods

    override func start() {
        if "admin" == "admins" {
            toMain()
        } else {
            t​oAuth​()
        }
    }

    // MARK: - Private Methods

    private func toMain() {
        tabBarController = UITabBarController()
        tabBarController?.tabBar.unselectedItemTintColor = .black
        tabBarController?.tabBar.tintColor = .appPaleBlue

        /// устанавливаем Recipe
        let recipeModuleView = AppBuilder.makeRecipeModule()
        let recipeCoordinator = RecipeCoordinator(rootController: recipeModuleView)
        recipeModuleView.presenter?.recipesCoordinator = recipeCoordinator
        add(coordinator: recipeCoordinator)

        /// устанавливаем Favorites
        let favoritesModuleView = AppBuilder.makeFavoriteModule()
        let favoritesCoordinator = FavoritesCoordinator(rootController: favoritesModuleView)
        favoritesModuleView.presenter?.favoritesCoordinator = favoritesCoordinator
        add(coordinator: favoritesCoordinator)

        /// устанавливаем Profile
        let profileCoordinator = ProfileCoordinator()
        let profileModule = AppBuilder.makeProfileModule(coordinator: profileCoordinator)
        profileCoordinator.setRootViewController(view: profileModule)
        add(coordinator: profileCoordinator)

        profileCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: recipeCoordinator)
            self?.remove(coordinator: favoritesCoordinator)
            self?.remove(coordinator: profileCoordinator)
            self?.tabBarController = nil
            self?.t​oAuth​()
        }

        guard let profileView = profileCoordinator.rootController else { return }

        tabBarController?.setViewControllers(
            [recipeCoordinator.rootController, favoritesCoordinator.rootController, profileView],
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
