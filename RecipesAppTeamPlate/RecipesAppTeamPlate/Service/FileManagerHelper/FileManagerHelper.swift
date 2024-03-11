// FileManagerHelper.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс для работы в FileManager
class FileManagerHelper {
    /// Записываем логи в documentDirectory
    static func writeLogEntry(logEntry: String) {
        /// текущая дата
        var currentDate: String {
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = dateFormatter.string(from: currentDate)
            return dateString
        }

        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            print(documentsDirectory.path)
            let fileUrl = documentsDirectory.appendingPathComponent("analyticsLogForRecipesApp.txt")
            if let fileHandle = try? FileHandle(forWritingTo: fileUrl) {
                let dateString = currentDate
                fileHandle.seekToEndOfFile()
                guard let data = "\n\(dateString) - \(logEntry)".data(using: .utf8) else { return }
                fileHandle.write(data)
                fileHandle.closeFile()
            } else {
                try? logEntry.write(to: fileUrl, atomically: true, encoding: .utf8)
            }
        }
    }
}
