// LoginCaretaker.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс Caretaker. Опекун: отвечает за сохранение и восстановление данных логина/пароля
class LoginCaretaker {
    static let shared = LoginCaretaker()
    let originator = LoginOriginator()

    func saveState() {
        let memento = originator.createMemento()

        UserDefaults.standard.set(memento.login, forKey: "loginMemento")
        UserDefaults.standard.set(memento.password, forKey: "passwordMemento")
        UserDefaults.standard.synchronize()
    }

    func restoreState() {
        guard let login = UserDefaults.standard.string(forKey: "loginMemento") else { return }
        guard let password = UserDefaults.standard.string(forKey: "passwordMemento") else { return }
        let memento = LoginMemento(login: login, password: password)
        originator.restore(from: memento)
    }
}
