// Originator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// класс Originator
class Originator {
    /// логин
    var login = ""
    /// пароль
    var password = ""

    func createMemento() -> Memento {
        Memento(login: login, password: password)
    }

    func restore(from memento: Memento) {
        login = memento.login
        password = memento.password
    }
}
