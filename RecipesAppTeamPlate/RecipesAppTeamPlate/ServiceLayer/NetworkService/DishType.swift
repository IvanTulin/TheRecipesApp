// DishType.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Категории рецептов
enum DishType: String {
    /// Салат
    case salad
    /// Суп
    case soup
    /// Курица
    case chicken
    /// Мясо
    case meat
    /// Рыба
    case fish
    /// Гарниры
    case sideDish
    /// Блины
    case pancake
    /// Напитки
    case drinks
    /// Десерты
    case desserts

    var discription: String {
        switch self {
        case .meat, .fish, .chicken, .sideDish:
            "Main course"
        case .salad:
            "Salad"
        case .soup:
            "Soup"
        case .pancake:
            "Pancake"
        case .drinks:
            "Drinks"
        case .desserts:
            "Desserts"
        }
    }
}
