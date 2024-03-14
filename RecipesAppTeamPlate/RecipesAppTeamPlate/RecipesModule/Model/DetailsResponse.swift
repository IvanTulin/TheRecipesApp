// DetailsResponse.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// структура данных рецепта
struct DetailsResponse {
    let label: String
    let image: String
    let images: Images
    let calories: Double
    let totalWeight: Double
    let totalTime: Int
    let totalNutrients: TotalNutrients
    let ingredientLines: [String]
}

/// структура данных картинок
struct Images {
    let large: Large?
}

/// структура данных ссылки на картинку
struct Large: Codable {
    let url: String
}

/// структура данных питательных веществ
struct TotalNutrients {
    let quantity: Double
}
