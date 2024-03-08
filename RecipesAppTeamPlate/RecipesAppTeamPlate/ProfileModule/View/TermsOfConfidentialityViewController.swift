// TermsOfConfidentialityViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран политики конфидециальности
class TermsOfConfidentialityViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let textForTermsOfUseLabel = "Terms of Use"
        static let nameFontBold = "Verdana-Bold"
        static let nameFontName = "Verdana"
    }

    // MARK: - Visual Components

    let controlLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let termsOfUseLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForTermsOfUseLabel
        label.font = UIFont(name: Constants.nameFontBold, size: 20)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var termsOfUseTextView: UITextView = {
        let text = UITextView()
        text.font = UIFont(name: Constants.nameFontName, size: 14)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    lazy var closedButton: UIButton = {
        let button = UIButton()
        button.setImage(.crossIcon, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(closedScreen), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Puplic Properties

    var bottonHandler: VoidHandler?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureLable()
        configureButton()
    }

    // MARK: - Public Methods

    func setupText(_ text: String) {
        termsOfUseTextView.text = text
    }

    // MARK: - Private Methods

    private func configureView() {
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor.rgba(red: 255, green: 255, blue: 255, alfa: 1)
        view.addSubview(controlLineView)

        NSLayoutConstraint.activate([
            controlLineView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controlLineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 17),
            controlLineView.widthAnchor.constraint(equalToConstant: 50),
            controlLineView.heightAnchor.constraint(equalToConstant: 5)
        ])
    }

    private func configureLable() {
        view.addSubview(termsOfUseLabel)
        view.addSubview(termsOfUseTextView)

        NSLayoutConstraint.activate([
            termsOfUseLabel.topAnchor.constraint(equalTo: controlLineView.topAnchor, constant: 26),
            termsOfUseLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),

            termsOfUseTextView.topAnchor.constraint(equalTo: termsOfUseLabel.bottomAnchor),
            termsOfUseTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            termsOfUseTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            termsOfUseTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)

        ])
    }

    private func configureButton() {
        view.addSubview(closedButton)

        NSLayoutConstraint.activate([
            closedButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 29),
            closedButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }

    @objc private func closedScreen() {
        bottonHandler?()
    }
}
