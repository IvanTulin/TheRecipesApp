// InfoSource.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

final class InfoSource: InfoSourceProtocol {
    /// Информация о пользователе
    private var personInfo = UserInfo(
        nameSurname: "Steve Wozniak",
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
