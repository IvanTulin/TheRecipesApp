// RecipesSrceenReceiver.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс-приемник RecipesSrceenReceiver
class RecipesSrceenReceiver: AnalyticsCommand {
    func execute() {
        let logEntry = "Пользователь открыл “Экран рецептов"
        FileManagerHelper.writeLogEntry(logEntry: logEntry)
    }
}
