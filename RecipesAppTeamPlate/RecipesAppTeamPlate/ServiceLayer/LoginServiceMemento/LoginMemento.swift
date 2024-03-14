// LoginMemento.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс Хранитель для логина/пароля
class LoginMemento {
    /// логин
    let login: String
    /// пароль
    let password: String

    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}
