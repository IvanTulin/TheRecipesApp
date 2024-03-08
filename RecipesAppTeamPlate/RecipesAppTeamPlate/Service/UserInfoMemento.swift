// UserInfoMemento.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Мементо
class UserInfoMemento {
    let profileImage: UIImage
    let surname: String

    init(profileImage: UIImage, surname: String) {
        self.profileImage = profileImage
        self.surname = surname
    }
}
