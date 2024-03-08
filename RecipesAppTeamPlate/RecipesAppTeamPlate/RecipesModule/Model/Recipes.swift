// Recipes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Источник информации
struct Recipes {
    var recipesInfo = [
        RecipesInfo(
            nameRecipesImage: "salad",
            nameRecipesLabel: "Salad",
            storageRecipes: []
        ),
        RecipesInfo(
            nameRecipesImage: "soup",
            nameRecipesLabel: "Soup",
            storageRecipes: []
        ),
        RecipesInfo(
            nameRecipesImage: "chicken",
            nameRecipesLabel: "Chicken",
            storageRecipes: []
        ),
        RecipesInfo(
            nameRecipesImage: "meat",
            nameRecipesLabel: "Meat",
            storageRecipes: []
        ),
        RecipesInfo(
            nameRecipesImage: "fish",
            nameRecipesLabel: "Fish",
            storageRecipes: [
                RecipesStorage(
                    dishLabel: "Simple Fish And Corn",
                    dishImage: "fish1",
                    dishTime: "60 min",
                    dishKkal: "274 kkal"
                ),
                RecipesStorage(
                    dishLabel: "Baked Fish with Lemon Herb Sauce",
                    dishImage: "BakedFishWithLemon",
                    dishTime: "90 min",
                    dishKkal: "616 kkal"
                ),
                RecipesStorage(
                    dishLabel: "Lemon and Chilli Fish Burrito",
                    dishImage: "LemonAndChilli",
                    dishTime: "90 min",
                    dishKkal: "226 kkal"
                ),
                RecipesStorage(
                    dishLabel: "Fast Roast Fish & Show Peas Recipes",
                    dishImage: "FastRoastFish",
                    dishTime: "80 min",
                    dishKkal: "94 kkal"
                ),
                RecipesStorage(
                    dishLabel: "Salmon with Cantaloupe and Fried Shallots",
                    dishImage: "Salmon",
                    dishTime: "100 min",
                    dishKkal: "410 kkal"
                ),
                RecipesStorage(
                    dishLabel: "Chilli and Tomato Fish",
                    dishImage: "ChilliAndTomato",
                    dishTime: "100 min",
                    dishKkal: "174 kkal"
                )
            ]
        ),
        RecipesInfo(
            nameRecipesImage: "sideDish",
            nameRecipesLabel: "SideDish",
            storageRecipes: []
        ),
        RecipesInfo(
            nameRecipesImage: "drinks",
            nameRecipesLabel: "Drinks",
            storageRecipes: []
        ),
        RecipesInfo(
            nameRecipesImage: "pancakes",
            nameRecipesLabel: "Pancakes",
            storageRecipes: []
        ),
        RecipesInfo(
            nameRecipesImage: "desserts",
            nameRecipesLabel: "Desserts",
            storageRecipes: []
        ),
    ]

    // var categoryTitle: String

    func getUserInfo() -> [RecipesInfo] {
        recipesInfo
    }
}
