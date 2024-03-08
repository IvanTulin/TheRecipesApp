// EmptyCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Пустая ячека при загрузке шимемра
class EmptyCell: UITableViewCell {
    // MARK: - Visual Components

    private lazy var intoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 12
        return view
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
    }

    // MARK: - Private Methods

    private func configureCell() {
        contentView.addSubview(intoView)

        intoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7).isActive = true
        intoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        intoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        intoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true
    }
}
