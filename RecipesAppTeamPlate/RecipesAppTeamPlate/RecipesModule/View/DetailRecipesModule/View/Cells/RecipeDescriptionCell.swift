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

    private let gradientDescribe: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.appLightBlue.cgColor,
            UIColor.white.cgColor
        ]
        gradient.cornerRadius = 24
        // gradient.maskedCorners =
        return gradient
    }()

    private let recipeLabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont(name: Constants.nameFontName, size: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

//    private lazy var recipeDescriptionTextView: UITextView = {
//        let textView = UITextView()
//        //textView.backgroundColor = .cyan
//        // textView.isScrollEnabled = true
//        textView.isEditable = true
//        textView.delegate = self
//        textView.font = UIFont(name: Constants.nameFontName, size: 14)
//        textView.layer.cornerRadius = 24
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        return textView
//    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        gradientDescribe.frame = rect
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            contentView.backgroundColor = .clear
        }
    }

    // MARK: - Public Methods

    func setupText(_ text: String) {
        // recipeDescriptionTextView.text = text
        recipeLabel.text = text
    }

    // MARK: - Private Methods

    private func configureCell() {
        contentView.layer.addSublayer(gradientDescribe)
        contentView.addSubview(recipeLabel)

        NSLayoutConstraint.activate([
            recipeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
            recipeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
            recipeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),
            recipeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])

        // contentView.addSubview(recipeDescriptionTextView)

//        NSLayoutConstraint.activate([
//            recipeDescriptionTextView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            recipeDescriptionTextView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
//            recipeDescriptionTextView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
//            recipeDescriptionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//
//            // recipeDescriptionTextView.widthAnchor.constraint(equalToConstant: 390),
        ////            recipeDescriptionTextView.heightAnchor.constraint(equalToConstant: 683),
//        ])
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
