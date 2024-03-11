// FavoriteService.swift
// Copyright © RoadMap. All rights reserved.

//
//  FavoriteService.swift
//  RecipesAppTeamPlate
//
//  Created by Игорь Девин on 10.03.2024.
//
import Foundation

final class FavoriteService {
    static let service = FavoriteService()
    static let userDefaults = UserDefaults.standard
    var favoriteRecipes: [RecipesStorage] = []
    private var key = "User"

    init(favoriteRecipes: [RecipesStorage] = [], key: String = "User") {
        self.favoriteRecipes = favoriteRecipes
        self.key = key
        getUserFavorite()
    }

    func getUserFavorite() {
        guard let data = FavoriteService.userDefaults.data(forKey: key) else { return }
        do {
            let user = try JSONDecoder().decode([RecipesStorage].self, from: data)
            favoriteRecipes = user
        } catch {
            print(error.localizedDescription)
        }
    }

    func save() {
        do {
            let data = try JSONEncoder().encode(favoriteRecipes)
            FavoriteService.userDefaults.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
}
