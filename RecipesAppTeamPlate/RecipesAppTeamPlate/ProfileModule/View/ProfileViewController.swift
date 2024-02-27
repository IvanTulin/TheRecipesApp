// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
class ProfileViewController: UIViewController {
    var presenter: ProfilePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension ProfileViewController: ProfileViewProtocol {}
