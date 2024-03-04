// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс общения с ProfileViewController
protocol ProfileViewProtocol: AnyObject {
    /// показываем алерт для смены имени пользователя
    func showChangeNameAlert()
    /// устанавливаем новое имя пользователю
    func setNewNameFromSource()
}

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let nameTitle = "Profile"
        static let nameFontBold = "Verdana-Bold"
        static let avatarIdentifier = "AvatarCell"
        static let userNameIdentifier = "UserNameCell"
        static let controlPanelIdentifier = "ControlPanelCell"
        static let nameSurname = "Name Surname"
        static let alertText = "Change your name and surname"
        static let cancelButtonText = "Cancel"
        static let okButtonText = "OK"
    }

    /// Тип данных
    enum InformationType {
        /// avatar профиля
        case avatar
        /// имя пользователя
        case userName
        /// посты
        case controlPanel
    }

    let informationTypes: [InformationType] = [.avatar, .userName, .controlPanel]

    // MARK: - Visual Components

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
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

    var presenter: ProfilePresenter?

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

    private func setNewName(_ newName: String) {
        presenter?.didSubmitNewName(newName)
    }
}

// MARK: - ProfileViewController + UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        informationTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch informationTypes[indexPath.section] {
        case .avatar:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.avatarIdentifier,
                for: indexPath
            ) as? AvatarCell else { return UITableViewCell() }
            guard let userInfo = presenter?.getUserInformation() else { return cell }
            cell.setUserInformation(userInfo) {}
            return cell
        case .userName:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.userNameIdentifier,
                for: indexPath
            ) as? UserNameCell else { return UITableViewCell() }
            guard let userInfo = presenter?.getUserInformation() else { return cell }
            cell.setUserInformation(userInfo) { [weak self] in
                self?.presenter?.actionChangeName()
            }
            return cell
        case .controlPanel:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.controlPanelIdentifier,
                for: indexPath
            ) as? ControlPanelCell else { return UITableViewCell() }
            cell.onEditButtonTapped = { [weak self] in
                guard let self = self else { return }
                self.presenter?.showBonusesViewController()
            }
            return cell
        }
    }
}

// MARK: - ProfileViewController + UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch informationTypes[indexPath.section] {
        case .avatar:
            return 180
        case .userName:
            return 31
        case .controlPanel:
            return 390
        }
    }
}

// MARK: - ProfileViewController + ProfileViewProtocol

extension ProfileViewController: ProfileViewProtocol {
    func showChangeNameAlert() {
        let alert = UIAlertController(title: Constants.alertText, message: nil, preferredStyle: .alert)
        alert.addTextField { text in
            text.placeholder = Constants.nameSurname
        }
        let actionOK = UIAlertAction(title: Constants.okButtonText, style: .cancel) { _ in
            guard let newName = alert.textFields?[0].text else { return }
            self.setNewName(newName)
        }
        let actionCancel = UIAlertAction(title: Constants.cancelButtonText, style: .default)

        alert.addAction(actionOK)
        alert.addAction(actionCancel)

        present(alert, animated: true)
    }

    func setNewNameFromSource() {
        tableView.reloadData()
    }
}
