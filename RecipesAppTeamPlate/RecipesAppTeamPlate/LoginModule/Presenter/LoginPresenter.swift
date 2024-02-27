// LoginPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol LoginViewProtocol: AnyObject {}

protocol LoginViewPresenterProtocol: AnyObject {
    init(view: LoginViewProtocol, source: Login)
}

/// Презентер логина
class LoginPresenter: LoginViewPresenterProtocol {
    weak var loginCoordinator: LoginCoordinator?
    let loginView: LoginViewProtocol
    let source: Login

    required init(view: LoginViewProtocol, source: Login) {
        loginView = view
        self.source = source
    }

    func showRecipesTabBarcontroller() {
        loginCoordinator?.onFinish()
    }
}
