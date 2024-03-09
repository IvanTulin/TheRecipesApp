// UserNameOriginator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// класс Originator- объект, состояние имени профиля которое нужно сохранить.
class UserNameOriginator {
    /// изображение профиля
    var userName = ""

    func createMemento() -> UserNameMemento {
        UserNameMemento(userName: userName)
    }

    func restore(from memento: UserNameMemento) {
        userName = memento.userName
    }
}
