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
        let loginSource = Login()
        let loginViewController = LoginViewController()
        let loginPresenter = LoginPresenter(view: loginViewController, source: loginSource)
        loginViewController.presenter = loginPresenter
        loginPresenter.loginCoordinator = self

        let rootController = UINavigationController(rootViewController: loginViewController)
        setAsRoot​(​_​: rootController)
        self.rootController = rootController
    }

    func nextViewController() {
        let loginViewController = LoginViewController()
        rootController?.pushViewController(loginViewController, animated: true)
    }
}
