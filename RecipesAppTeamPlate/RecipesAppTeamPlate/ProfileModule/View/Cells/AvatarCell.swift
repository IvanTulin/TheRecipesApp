// AvatarCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка Аватара пользователя
final class AvatarCell: UITableViewCell {
    // MARK: - Visual Components

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 80
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changePhoto))
        imageView.addGestureRecognizer(tapGesture)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Puplic Properties

    var buttonChangePhotoHandler: VoidHandler?

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImageView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureImageView()
    }

    // MARK: - Public Methods

    func setUserInformation(
        _ userInfo: UserInfo,
        changePhotoComplition: @escaping VoidHandler
    ) {
        avatarImageView.image = UIImage(data: userInfo.userImageData)
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill

        // TODO: Реализовать смену фотографии
        buttonChangePhotoHandler = changePhotoComplition
    }

    // MARK: - Private Methods

    private func configureImageView() {
        selectionStyle = .none
        contentView.addSubview(avatarImageView)

        NSLayoutConstraint.activate([
            avatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 160),
            avatarImageView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }

    @objc private func changePhoto() {
        print("changePhoto")
        buttonChangePhotoHandler?()
    }
}
