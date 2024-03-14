// UserInfo.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// данные пользователя
struct UserInfo {
    /// Имя и фамилия пользователя
    var nameSurname: String
    /// Название фото пользователя
    var userImageData: Data
    /// Количество бонусов
    var bonusesCount: Int
    /// Текст условия конфидициальности
    var textForDescription: String

    init(
        nameSurname: String,
        userImageData: Data = UIImage(named: "userDefaultIcon")?.pngData() ?? Data(),
        bonusesCount: Int,
        textForDescription: String
    ) {
        self.nameSurname = nameSurname
        self.userImageData = userImageData
        self.bonusesCount = bonusesCount
        self.textForDescription = textForDescription
    }
}
