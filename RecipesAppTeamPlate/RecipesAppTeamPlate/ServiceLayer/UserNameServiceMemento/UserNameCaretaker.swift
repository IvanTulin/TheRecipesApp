// UserNameCaretaker.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс Caretaker. Опекун: отвечает за сохранение и восстановление имени  профиля
class UserNameCaretaker {
    static let shared = UserNameCaretaker()
    let originator = UserNameOriginator()

    func saveState() {
        let memento = originator.createMemento()

        UserDefaults.standard.set(memento.userName, forKey: "userNameMemento")
        UserDefaults.standard.synchronize()
    }

    func restoreState() {
        guard let userName = UserDefaults.standard.string(forKey: "userNameMemento") else { return }
        let memento = UserNameMemento(userName: userName)
        originator.restore(from: memento)
    }
}
