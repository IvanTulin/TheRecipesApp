// UserInfo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// данные пользователя
struct UserInfo {
    /// Имя и фамилия пользователя
    var nameSurname: String
    /// Название фото пользователя
    var userPhotoName: String
    /// Количество бонусов
    var bonusesCount: Int
    /// Текст условия конфидициальности
    var textForDescription: String

    init(
        nameSurname: String,
        userPhotoName: String = "userDefaultIcon",
        bonusesCount: Int,
        textForDescription: String
    ) {
        self.nameSurname = nameSurname
        self.userPhotoName = userPhotoName
        self.bonusesCount = bonusesCount
        self.textForDescription = textForDescription
    }
}
