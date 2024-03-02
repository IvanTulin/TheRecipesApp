// UIView + Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UIView {
    /// Создаем кастомную тень снизу
    func addShadow() {
        layer.shadowColor = UIColor.systemGray2.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 1
        layer.shadowRadius = 2
        layer.masksToBounds = false
    }
}
