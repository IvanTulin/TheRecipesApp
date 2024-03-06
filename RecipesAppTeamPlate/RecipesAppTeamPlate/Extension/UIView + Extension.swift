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

    /// Создаем шимер
    func startShimmering() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.white.withAlphaComponent(0.5).cgColor,
            UIColor.clear.cgColor
        ]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = bounds

        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 1.0
        animation.fromValue = -bounds.width
        animation.toValue = bounds.width
        animation.repeatCount = .greatestFiniteMagnitude
        gradientLayer.add(animation, forKey: "shimmerAnimation")

        layer.mask = gradientLayer
    }

    /// Удаляем шимер
    func stopShimmering() {
        layer.mask = nil
    }
}
