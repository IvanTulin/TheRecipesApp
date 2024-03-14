// CategoriesSrceenReceiver.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс-приемник CategoriesSrceenReceiver
class CategoriesSrceenReceiver: AnalyticsCommand {
    func execute() {
        let logEntry = "Пользовать перешел на Экран со списком рецептов из Рыбы"
        FileManagerHelper.writeLogEntry(logEntry: logEntry)
    }
}
