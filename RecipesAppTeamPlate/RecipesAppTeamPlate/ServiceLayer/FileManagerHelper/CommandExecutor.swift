// CommandExecutor.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс Invoker(Отправитель), запрашивает выполнение команды
class CommandExecutor {
    private var analyticCommands: [AnalyticsCommand] = []

    func addCommand(command: AnalyticsCommand) {
        analyticCommands.append(command)
    }

    func makeRecord() {
        for command in analyticCommands {
            command.execute()
        }
    }
}
