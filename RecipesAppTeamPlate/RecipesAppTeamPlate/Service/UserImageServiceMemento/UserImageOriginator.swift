// UserImageOriginator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// класс Originator- объект, состояние фото профиля которое нужно сохранить.
class UserImageOriginator {
    /// изображение профиля
    var image = Data()

    func createMemento() -> UserImageMemento {
        UserImageMemento(image: image)
    }

    func restore(from memento: UserImageMemento) {
        image = memento.image
    }
}
