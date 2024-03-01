// ProfileInfo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Источник информации
final class ProfileInfo: InfoSourceProtocol {
    /// Информация о пользователе
    private var personInfo = UserInfo(
        nameSurname: "Surname Name",
        userPhotoName: "avatarForProfile",
        bonusesCount: 200
    )

    func getUserInfo() -> UserInfo {
        personInfo
    }

    func changeUserName(nameSurname: String) {
        personInfo.nameSurname = nameSurname
    }

    func getBonusesCount() -> Int {
        personInfo.bonusesCount
    }
}
