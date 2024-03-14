// UserImageMemento.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс Хранитель для фото профиля
class UserImageMemento {
    /// изображение профиля
    let image: Data

    init(image: Data) {
        self.image = image
    }
}
