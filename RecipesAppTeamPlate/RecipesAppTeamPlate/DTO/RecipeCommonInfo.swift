// RecipeCommonInfo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

final class RecipeCommonInfo {
    /// картинка
    let image: String
    /// заголловок
    let label: String
    /// время приготовллениия
    let totaltime: Double
    /// калории
    let calories: Int
    /// URI
    let uri: String

    init(dto: RecipeDTO) {
        image = dto.image
        label = dto.label
        totaltime = dto.totalTime
        calories = Int(dto.calories)
        uri = dto.uri
    }
}
