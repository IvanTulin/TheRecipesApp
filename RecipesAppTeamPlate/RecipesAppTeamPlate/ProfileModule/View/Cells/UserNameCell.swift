// UserNameCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка имени пользователя
final class UserNameCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let nameFontBold = "Verdana-Bold"
        static let nameKey = "saveName"
        static let nameKeyMemento = "userNameMemento"
    }

    let userNameCaretaker = UserNameCaretaker()

    // MARK: - Visual Components

    var userNameLabel: UILabel = {
        let userNamelabel = UILabel()
        userNamelabel.textAlignment = .center
        userNamelabel.font = UIFont(name: Constants.nameFontBold, size: 28)
        userNamelabel.textColor = .darkGray
        userNamelabel.translatesAutoresizingMaskIntoConstraints = false
        return userNamelabel
    }()

    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(.pencilIcon, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private Properties

    private var onEditButtonTappedHandler: VoidHandler?
    private var buttonChangeHandler: VoidHandler?
    private var presenter: ProfilePresenter!

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLabel()
        configureButton()
        selectionStyle = .none
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureLabel()
        configureButton()
        selectionStyle = .none
    }

    // MARK: - Public Methods

    func setUserInformation(
        _ userInfo: UserInfo,
        changeNameComplition: @escaping () -> ()
    ) {
        /// Загружаем имя пользователя из ProfileServiceMemento при инициализации
        userNameCaretaker.restoreState()

        if UserDefaults.standard.string(forKey: Constants.nameKeyMemento) != nil {
            userNameLabel.text = userNameCaretaker.originator.userName
        } else {
            userNameLabel.text = "\(userInfo.nameSurname)"
        }
//        if let userName = UserDefaults.standard.string(forKey: Constants.nameKey) {
//            userNameLabel.text = userName
//        } else {
//            userNameLabel.text = "\(userInfo.nameSurname)"
//        }
        buttonChangeHandler = changeNameComplition
    }

    // MARK: - Private Methods

    private func configureLabel() {
        contentView.addSubview(userNameLabel)

        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            userNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 51),
            userNameLabel.widthAnchor.constraint(equalToConstant: 256),
            userNameLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }

    private func configureButton() {
        contentView.addSubview(editButton)

        NSLayoutConstraint.activate([
            editButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            editButton.leftAnchor.constraint(equalTo: userNameLabel.rightAnchor, constant: 11),
        ])
    }

    @objc private func showAlert() {
        buttonChangeHandler?()
    }
}
