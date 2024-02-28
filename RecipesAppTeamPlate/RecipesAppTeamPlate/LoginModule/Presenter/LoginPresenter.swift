// LoginPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с LoginView
protocol LoginViewProtocol: AnyObject {}

/// Интерфейс общения с LoginPresenter
protocol LoginViewPresenterProtocol: AnyObject {
    init(view: LoginViewProtocol, source: Login)
}

/// Презентер логина
class LoginPresenter: LoginViewPresenterProtocol {
    // MARK: - Constants

    let loginView: LoginViewProtocol
    let source: Login

    // MARK: - Puplic Properties

    weak var loginCoordinator: LoginCoordinator?

    // MARK: - Initializers

    required init(view: LoginViewProtocol, source: Login) {
        loginView = view
        self.source = source
    }

    // MARK: - Public Methods

    func showRecipesTabBarcontroller() {
        loginCoordinator?.onFinish()
    }
}
