// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let nameTitle = "Profile"
        static let nameFontBold = "Verdana-Bold"
        static let avatarIdentifier = "AvatarCell"
        static let userNameIdentifier = "UserNameCell"
        static let controlPanelIdentifier = "ControlPanelCell"
    }

    /// Тип данных
    enum InformationType {
        /// adatar профиля
        case avatar
        /// имя пользователя
        case userName
        /// посты
        case controlPanel
    }

    let informationType: [InformationType] = [.avatar, .userName, .controlPanel]

    // MARK: - Visual Components

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            AvatarCell.self,
            forCellReuseIdentifier: Constants.avatarIdentifier
        )
        tableView.register(
            UserNameCell.self,
            forCellReuseIdentifier: Constants.userNameIdentifier
        )
        tableView.register(
            ControlPanelCell.self,
            forCellReuseIdentifier: Constants.controlPanelIdentifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Properties

    var presenter: ProfilePresenter!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = Constants.nameTitle
    }

    private func configureTableView() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - ProfileViewController + ProfileViewProtocol

extension ProfileViewController: ProfileViewProtocol {}

// MARK: - ProfileViewController + UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        informationType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch informationType[indexPath.section] {
        case .avatar:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.avatarIdentifier, for: indexPath)
            cell.backgroundColor = .gray
            return cell
        case .userName:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userNameIdentifier, for: indexPath)
            cell.backgroundColor = .white
            return cell
        case .controlPanel:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.controlPanelIdentifier, for: indexPath)
            cell.backgroundColor = .magenta
            return cell
        }
    }
}

// MARK: - ProfileViewController + UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch informationType[indexPath.section] {
        case .avatar:
            return 180
        case .userName:
            return 31
        case .controlPanel:
            return 390
        }
    }
}
