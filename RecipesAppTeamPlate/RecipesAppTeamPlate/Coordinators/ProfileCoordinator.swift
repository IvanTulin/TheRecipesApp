// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор избранных рецептов
final class ProfileCoordinator: BaseCoordinator {
    // MARK: - Puplic Properties

    var rootController: UINavigationController?
    var onFinishFlow: VoidHandler?
    var dismissBonuses: VoidHandler?

    // MARK: - Public Methods

    func setRootViewController(view: UIViewController) {
        rootController = UINavigationController(
            rootViewController: view
        )
    }

    func pushProfile() {
        let profileViewController = ProfileViewController()
        rootController?.pushViewController(profileViewController, animated: true)
    }

    func showBonusesViewController() {
        let bonusesViewController = AppBuilder.createBonusesProfileModule()
        if let sheet = bonusesViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 30
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
        dismissBonuses = {
            bonusesViewController.dismiss(animated: true)
        }
        (bonusesViewController as? ProfileBonusesViewProtocol)?.presenter?.coordinator = self
        rootController?.present(bonusesViewController, animated: true)
    }
}
