// UserImageCaretaker.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс Caretaker. Опекун: отвечает за сохранение и восстановление фото  профиля
class UserImageCaretaker {
    static let shared = UserImageCaretaker()
    let originator = UserImageOriginator()

    func saveState() {
        let memento = originator.createMemento()

        UserDefaults.standard.set(memento.image, forKey: "imageMemento")
        UserDefaults.standard.synchronize()
        print("save")
    }

    func restoreState() {
        guard let image = UserDefaults.standard.data(forKey: "imageMemento") else { return }
        let memento = UserImageMemento(image: image)
        originator.restore(from: memento)
        print("restore")
    }
}
