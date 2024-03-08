// Caretaker.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс Caretaker
class Caretaker {
    static let shared = Caretaker()
    let originator = Originator()

    func saveState() {
        let memento = originator.createMemento()

        UserDefaults.standard.set(memento.login, forKey: "loginMemento")
        UserDefaults.standard.set(memento.password, forKey: "passwordMemento")
        UserDefaults.standard.synchronize()
    }

    func restoreState() {
        guard let login = UserDefaults.standard.string(forKey: "loginMemento") else { return }
        guard let password = UserDefaults.standard.string(forKey: "passwordMemento") else { return }
        let memento = Memento(login: login, password: password)
        originator.restore(from: memento)
    }
}
