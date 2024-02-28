// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор избранных рецептов
final class ProfileCoordinator: BaseCoordinator {
    // MARK: - Puplic Properties
    
    var rootController: UINavigationController
    var onFinishFlow: (() -> ())?

    //MARK: - Initializers
    
    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }

    // MARK: - Public Methods
    
    func pushProfile() {
        let profileViewController = ProfileViewController()
        rootController.pushViewController(profileViewController, animated: true)
    }

    func showBonusesViewController() {
        let bonusesViewController = BonusesViewController()
        rootController.modalPresentationStyle = .pageSheet

        if let sheet = bonusesViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 24
        }

        rootController.present(bonusesViewController, animated: true)
//        rootController.pushViewController(bonusesViewController, animated: true)
    }
}
