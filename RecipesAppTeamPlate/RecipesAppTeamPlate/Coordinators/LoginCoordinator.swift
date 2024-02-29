// LoginCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор авторизации
final class LoginCoordinator: BaseCoordinator {
    // MARK: - Puplic Properties

    var rootController: UINavigationController?
    var onFinishFlow: (() -> ())?

    // MARK: - Public Methods

    override func start() {
        showLogin()
    }

    func onFinish() {
        onFinishFlow?()
    }

    func showLogin() {
        let loginViewController = LoginViewController()
        let loginPresenter = LoginPresenter(view: loginViewController)
        loginViewController.autorizationPresenter = loginPresenter
        loginPresenter.autorizationCoordinator = self

        let rootController = UINavigationController(rootViewController: loginViewController)
        setAsRoot​(​_​: rootController)
        self.rootController = rootController
    }

    func nextViewController() {
        let loginViewController = LoginViewController()
        rootController?.pushViewController(loginViewController, animated: true)
    }
}
