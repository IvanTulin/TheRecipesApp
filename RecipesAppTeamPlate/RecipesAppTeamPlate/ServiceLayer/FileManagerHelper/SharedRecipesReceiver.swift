// SharedRecipesReceiver.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс-приемник SharedRecipesReceiver
class SharedRecipesReceiver: AnalyticsCommand {
    func execute() {
        let logEntry = "Пользователь поделился рецептом из Семги"
        FileManagerHelper.writeLogEntry(logEntry: logEntry)
    }
}
