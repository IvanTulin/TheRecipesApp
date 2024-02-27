// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор избранных рецептов
final class ProfileCoordinator: BaseCoordinator {
    var rootController: UINavigationController
    var onFinishFlow: (() -> ())?

    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }

    func pushProfile() {
        let profileViewController = ProfileViewController()
        rootController.pushViewController(profileViewController, animated: true)
    }
}
