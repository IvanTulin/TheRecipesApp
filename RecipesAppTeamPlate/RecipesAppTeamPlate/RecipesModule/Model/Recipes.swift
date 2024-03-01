// Recipes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Источник информации
struct Recipes {
    let recipesInfo = [
        RecipesInfo(
            nameRecipesImage: "salad",
            nameRecipesLabel: "Salad"
        ),
        RecipesInfo(
            nameRecipesImage: "soup",
            nameRecipesLabel: "Soup"
        ),
        RecipesInfo(
            nameRecipesImage: "chicken",
            nameRecipesLabel: "Chicken"
        ),
        RecipesInfo(
            nameRecipesImage: "meat",
            nameRecipesLabel: "Meat"
        ),
        RecipesInfo(
            nameRecipesImage: "fish",
            nameRecipesLabel: "Fish"
        ),
        RecipesInfo(
            nameRecipesImage: "sideDish",
            nameRecipesLabel: "SideDish"
        ),
        RecipesInfo(
            nameRecipesImage: "drinks",
            nameRecipesLabel: "Drinks"
        ),
        RecipesInfo(
            nameRecipesImage: "pancakes",
            nameRecipesLabel: "Pancakes"
        ),
        RecipesInfo(
            nameRecipesImage: "desserts",
            nameRecipesLabel: "Desserts"
        ),
    ]

    // var categoryTitle: String

    func getUserInfo() -> [RecipesInfo] {
        recipesInfo
    }
}
