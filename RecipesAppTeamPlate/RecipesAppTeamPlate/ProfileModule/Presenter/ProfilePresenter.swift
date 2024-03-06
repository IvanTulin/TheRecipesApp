// ProfilePresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с ProfilePresenter
protocol ProfileViewPresenterProtocol: AnyObject {
    /// Получить информацию пользователя
    func getUserInformation() -> UserInfo?
    /// Редактируем профиль
    func profiledEditButtonTapped()
    /// Установка нового имени пользователю
    func didSubmitNewName(_ name: String)
    /// Вызов алерта для смены имени
    func actionChangeName()
}

/// Протокол источника информации
protocol InfoSourceProtocol: AnyObject {
    /// Получаем данные пользователя
    func getUserInfo() -> UserInfo
    /// Меняем имя пользователя
    func changeUserName(nameSurname: String)
    /// Задаем количество бонусов
    func getBonusesCount() -> Int
    /// Получаем тескт описания
    func getTextDescription() -> String
}

/// Презентер профиля
final class ProfilePresenter: ProfileViewPresenterProtocol {
    // MARK: - Puplic Properties

    private weak var profileView: ProfileViewProtocol?
    private weak var profileCoordinator: ProfileCoordinator?
    var profileInfo: InfoSourceProtocol?

    // MARK: - Initializers

    init(view: ProfileViewProtocol?, coordinator: ProfileCoordinator?) {
        profileView = view
        profileCoordinator = coordinator
    }

    // MARK: - Public Methods

    func getUserInformation() -> UserInfo? {
        profileInfo?.getUserInfo()
    }

    func profiledEditButtonTapped() {
        profileView?.showChangeNameAlert()
    }

    func actionChangeName() {
        profileView?.showChangeNameAlert()
    }

    func didSubmitNewName(_ name: String) {
        profileInfo?.changeUserName(nameSurname: name)
        profileView?.setNewNameFromSource()
    }

    func showBonusesViewController() {
        profileCoordinator?.showBonusesViewController()
    }

    func showTermsOfConfidentiality() {
        profileView?.showTermsOfConfidentialityController()
    }

    func getTextDescription() -> String {
        profileInfo?.getTextDescription() ?? ""
    }
}
