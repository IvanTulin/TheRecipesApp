// ProfilePresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol ProfileViewProtocol: AnyObject {}

protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol, source: Profile)
}

/// Презентер профиля
class ProfilePresenter: ProfileViewPresenterProtocol {
    weak var profileCoordinator: ProfileCoordinator?
    let profileView: ProfileViewProtocol
    let source: Profile

    required init(view: ProfileViewProtocol, source: Profile) {
        profileView = view
        self.source = source
    }
}
