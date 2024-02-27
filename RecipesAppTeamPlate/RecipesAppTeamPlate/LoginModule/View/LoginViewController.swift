// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран регистрации
class LoginViewController: UIViewController {
    // MARK: - Visual Components

    private lazy var loginBitton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(showRecipesTabBarcontroller), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Properties

    var presenter: LoginPresenter!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(loginBitton)

        NSLayoutConstraint.activate([
            loginBitton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBitton.topAnchor.constraint(equalTo: view.topAnchor, constant: 377),
            loginBitton.widthAnchor.constraint(equalToConstant: 350),
            loginBitton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

    @objc private func showRecipesTabBarcontroller() {
        presenter.showRecipesTabBarcontroller()
    }
}

extension LoginViewController: LoginViewProtocol {}
