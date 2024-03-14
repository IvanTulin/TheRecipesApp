// Recipes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Источник информации
struct Recipes: Codable {
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

    lazy var category: [Category] = [
        .init(avatarImageName: "salad", categoryTitle: .salad, sizeCell: .medium, recepies: []),
        .init(avatarImageName: "soup", categoryTitle: .soup, sizeCell: .medium, recepies: []),
        .init(
            avatarImageName: "chicken",
            categoryTitle: .chicken,
            sizeCell: .big,
            recepies: []
        ),
        .init(avatarImageName: "meat", categoryTitle: .meat, sizeCell: .small, recepies: []),
        .init(avatarImageName: "fish", categoryTitle: .fish, sizeCell: .small, recepies: []),
        .init(
            avatarImageName: "side dish",
            categoryTitle: .sideDish,
            sizeCell: .small,
            recepies: []
        ),
        .init(avatarImageName: "drinks", categoryTitle: .drinks, sizeCell: .big, recepies: []),
        .init(
            avatarImageName: "pancakes",
            categoryTitle: .pancake,
            sizeCell: .medium,
            recepies: []
        ),
        .init(
            avatarImageName: "desserts",
            categoryTitle: .desserts,
            sizeCell: .medium,
            recepies: []
        )
    ]

    func getUserInfo() -> [RecipesInfo] {
        recipesInfo
    }
}

/// RecipesNetwork
struct RecipesNetwork {
    var recipesInfoNetwork: [RecipeCommonInfo] = []

    func getUserInfoNetwork() -> [RecipeCommonInfo] {
        recipesInfoNetwork
    }
}
