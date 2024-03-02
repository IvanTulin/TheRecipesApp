// RecipeDescriptionCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с описанием рецепта
class RecipeDescriptionCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let nameFontName = "Verdana"
    }

    // MARK: - Private Constants

    private lazy var recipeDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .cyan
        // textView.isScrollEnabled = true
        textView.isEditable = true
        textView.delegate = self
        textView.font = UIFont(name: Constants.nameFontName, size: 14)
        textView.layer.cornerRadius = 24
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            contentView.backgroundColor = .clear
        }
    }

    // MARK: - Public Methods

    func setupText(_ text: String) {
        recipeDescriptionTextView.text = text
    }

    // MARK: - Private Methods

    private func configureCell() {
        contentView.addSubview(recipeDescriptionTextView)

        NSLayoutConstraint.activate([
            recipeDescriptionTextView.topAnchor.constraint(equalTo: contentView.topAnchor),
            recipeDescriptionTextView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            recipeDescriptionTextView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            recipeDescriptionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            // recipeDescriptionTextView.widthAnchor.constraint(equalToConstant: 390),
//            recipeDescriptionTextView.heightAnchor.constraint(equalToConstant: 683),
        ])
    }
}

extension RecipeDescriptionCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
//            let size = textView.bounds.size
//            let newSize = textView.sizeThatFits(CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude))
//
//            if size.height != newSize.height {
//                textViewHeightConstraint.constant = newSize.height // textViewHeightConstraint - констрейнт высоты для
//                UITextView
//                tableView.beginUpdates()
//                tableView.endUpdates()
//            }
    }
}
