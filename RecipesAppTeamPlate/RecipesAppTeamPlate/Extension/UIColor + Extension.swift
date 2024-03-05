// UIColor + Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Создаем паттерн - легковес для UIColor
extension UIColor {
    /// хранилище цветов
    static var colorStoreMap: [String: UIColor] = [:]

    /// установка нового/загрузка имеющего цвета из colorStoreMap
    static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alfa: CGFloat) -> UIColor {
        let key = "\(red)\(green)\(blue)\(alfa)"

        if let color = colorStoreMap[key] {
            return color
        } else {
            let color = UIColor(red: red, green: green, blue: blue, alpha: alfa)
            colorStoreMap[key] = color
            return color
        }
    }
}
