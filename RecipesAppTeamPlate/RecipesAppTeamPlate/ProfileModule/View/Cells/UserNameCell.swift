// UserNameCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка имени пользователя
class UserNameCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let textForUserName = "Surname Name"
        static let nameFontBold = "Verdana-Bold"
    }

    // MARK: - Visual Components

    var userNamelabel: UILabel = {
        let userNamelabel = UILabel()
        userNamelabel.text = Constants.textForUserName
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

    // MARK: - Puplic Properties

    var onEditButtonTapped: (() -> ())?
    var presenter: ProfilePresenter!

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

    // MARK: - Private Methods

    private func configureLabel() {
        contentView.addSubview(userNamelabel)

        NSLayoutConstraint.activate([
            userNamelabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            userNamelabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 51),
            userNamelabel.widthAnchor.constraint(equalToConstant: 256),
            userNamelabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }

    private func configureButton() {
        contentView.addSubview(editButton)

        NSLayoutConstraint.activate([
            editButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            editButton.leftAnchor.constraint(equalTo: userNamelabel.rightAnchor, constant: 11),
        ])
    }

    @objc private func showAlert() {
        onEditButtonTapped?()
    }
}

// extension UserNameCell: CellDelegate {
//    func didSubmitNewName(_ name: String) {
//        userNamelabel.text = name
//    }
// }
