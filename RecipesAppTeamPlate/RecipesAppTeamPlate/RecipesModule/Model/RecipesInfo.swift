// RecipesInfo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// данные о рецептах
struct RecipesInfo {
    ///  название картинки рецепта
    var nameRecipesImage: String
    ///  название лейбла рецепта
    var nameRecipesLabel: String
    /// массив рецептов
    var storageRecipes: [RecipesStorage]
}
