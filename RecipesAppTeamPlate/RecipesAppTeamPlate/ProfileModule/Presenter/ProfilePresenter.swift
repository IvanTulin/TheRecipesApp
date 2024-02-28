// ProfilePresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс общения с ProfileView
protocol ProfileViewProtocol: AnyObject {
    func presentNameChangeAlert()
}

/// Интерфейс общения с ProfilePresenter
protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol, source: Profile)

    func profiledEditButtonTapped()
    func didSubmitNewName(_ name: String)
}

/// Презентер профиля
class ProfilePresenter: ProfileViewPresenterProtocol {
    // MARK: - Constants
    
    let profileView: ProfileViewProtocol
    var source: Profile
    
    // MARK: - Puplic Properties
    
    weak var profileCoordinator: ProfileCoordinator?

    //MARK: - Initializers
    
    required init(view: ProfileViewProtocol, source: Profile) {
        profileView = view
        self.source = source
    }

    // MARK: - Public Methods
    func profiledEditButtonTapped() {
        profileView.presentNameChangeAlert()
    }

    func didSubmitNewName(_ name: String) {
        source.userName = name
    }

    func showBonusesViewController() {
        profileCoordinator?.showBonusesViewController()
    }
}
