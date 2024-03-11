// RecipesStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Xранилище для ячейки Рыба
struct RecipesStorage: Codable {
    /// лейбл рыбных блюд
    var dishLabel: String
    /// изображение рыбных блюд
    var dishImage: String
    /// таймер рыбных блюд
    var dishTime: String
    /// текст для калорий блюд
    var dishKkal: String
}
