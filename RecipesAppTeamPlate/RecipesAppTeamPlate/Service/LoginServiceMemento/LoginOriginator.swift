// LoginOriginator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// класс Originator- объект, состояние логина/пароля которые нужно сохранить.
class LoginOriginator {
    /// логин
    var login = ""
    /// пароль
    var password = ""

    func createMemento() -> LoginMemento {
        LoginMemento(login: login, password: password)
    }

    func restore(from memento: LoginMemento) {
        login = memento.login
        password = memento.password
    }
}
