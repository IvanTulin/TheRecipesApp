// UserInfoService.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Originator/Создатель
class UserInfoService {
    // MARK: - Constants

    enum Constants {
        static let userInfoKey = "userInfoKey"
    }

    // MARK: - Public Methods

    func saveUserInfo(profileImage: UIImage, surname: String) {
        let memento = UserInfoMemento(profileImage: profileImage, surname: surname)
    }

    func getUserInfo() -> UserInfoMemento? {
        if let data = UserDefaults.standard.data(forKey: Constants.userInfoKey),
           let memento = try? NSKeyedUnarchiver
           .unarchiveTopLevelObjectWithData(data) as? UserInfoMemento { return memento }
        return nil
    }

    func clearUserInfo() {
        UserDefaults.standard.removeObject(forKey: Constants.userInfoKey)
    }

    // MARK: - Private Methods

    private func saveMemento(_ memento: UserInfoMemento) {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: memento, requiringSecureCoding: false)
        UserDefaults.standard.set(data, forKey: Constants.userInfoKey)
    }
}
