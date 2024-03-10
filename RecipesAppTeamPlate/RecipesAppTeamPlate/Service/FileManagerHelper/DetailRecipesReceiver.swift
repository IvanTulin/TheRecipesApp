// DetailRecipesReceiver.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс-приемник DetailRecipesReceiver
class DetailRecipesReceiver: AnalyticsCommand {
    func execute() {
        let logEntry = "Пользователь открыл рецепт блюда из семги"
        FileManagerHelper.writeLogEntry(logEntry: logEntry)
    }
}
