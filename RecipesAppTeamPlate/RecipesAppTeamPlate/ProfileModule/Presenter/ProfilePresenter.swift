// ProfilePresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с ProfilePresenter
protocol ProfileViewPresenterProtocol: AnyObject {
    func getUserInformation() -> UserInfo?
    func profiledEditButtonTapped()
    func didSubmitNewName(_ name: String)
    func actionChangeName()
}

/// Протокол источника информации
protocol InfoSourceProtocol: AnyObject {
    func getUserInfo() -> UserInfo
    func changeUserName(nameSurname: String)
    func getBonusesCount() -> Int
}

/// Презентер профиля
final class ProfilePresenter: ProfileViewPresenterProtocol {
    // MARK: - Puplic Properties

    private weak var profileView: ProfileViewProtocol?
    private weak var profileCoordinator: ProfileCoordinator?
    var infoSource: InfoSourceProtocol?

    // MARK: - Initializers

    init(view: ProfileViewProtocol?, coordinator: ProfileCoordinator?) {
        profileView = view
        profileCoordinator = coordinator
    }

    // MARK: - Public Methods

    func getUserInformation() -> UserInfo? {
        infoSource?.getUserInfo()
    }

    func profiledEditButtonTapped() {
        profileView?.showChangeNameAlert()
    }

    func actionChangeName() {
        profileView?.showChangeNameAlert()
    }

    func didSubmitNewName(_ name: String) {
        infoSource?.changeUserName(nameSurname: name)
        profileView?.setNewNameFromSource()
    }

    func showBonusesViewController() {
        profileCoordinator?.showBonusesViewController()
    }
}
