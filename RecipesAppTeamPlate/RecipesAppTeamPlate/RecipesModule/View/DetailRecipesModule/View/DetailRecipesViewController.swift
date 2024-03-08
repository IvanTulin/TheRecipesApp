// DetailRecipesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс общения с DetailRecipesViewController
protocol DetailRecipesViewProtocol: AnyObject {
    ///  Презентер экрана
    var presenter: DetailRecipesPresenter? { get set }

    /// Получить данные с хранилища
    func getDetailRecipes(detail: RecipesStorage)
    /// Установить титл
    func setTittle()
}

/// Экран описания рецепта
class DetailRecipesViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let pictureOfDiskIdentifier = "PictureOfDishCell"
        static let caloriesIdentifier = "CalorieCell"
        static let recipeDescriptionIdentifier = "RecipeDescriptionCell"
    }

    /// Тип данных
    enum InforantionType {
        /// изображение рецепта
        case picture
        /// калории рецепта
        case calorie
        /// описание рецепта
        case description
    }

    let informationTypes: [InforantionType] = [.picture, .calorie, .description]

    // MARK: - Visual Components

    private lazy var tittleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-Bold", size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        tableView.register(PictureOfDishCell.self, forCellReuseIdentifier: Constants.pictureOfDiskIdentifier)
        tableView.register(CalorieCell.self, forCellReuseIdentifier: Constants.caloriesIdentifier)
        tableView.register(RecipeDescriptionCell.self, forCellReuseIdentifier: Constants.recipeDescriptionIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .black
        return button
    }()

    private let favoritesButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(.favorites, for: .normal)
        button.tintColor = .black
        return button
    }()

    lazy var backButton: UIButton = {
        let customButton = UIButton(type: .custom)
        customButton.setImage(.backButton, for: .normal)
        customButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 28)
        customButton.setTitleColor(.black, for: .normal)
        customButton.addTarget(self, action: #selector(backToTheLastController), for: .touchUpInside)
        return customButton
    }()

    // MARK: - Public Methods

    var presenter: DetailRecipesPresenter?
    var detailRecipes: RecipesStorage?
    var descriptions = Description()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigation()
        presenter?.getDetailRecipes()
        presenter?.getTextForTittle()
    }

    override func viewWillAppear(_ animated: Bool) {
        // navigationController?.navigationBar.isHidden = true
    }

    // MARK: - Private Methods

    private func configureTableView() {
        view.backgroundColor = .white
        view.addSubview(tittleLabel)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tittleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tittleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            tittleLabel.widthAnchor.constraint(equalToConstant: 350),
            tittleLabel.heightAnchor.constraint(equalToConstant: 56),

            tableView.topAnchor.constraint(equalTo: tittleLabel.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func configureNavigation() {
        let backBarButtomItem = UIBarButtonItem(customView: backButton)
        let shareBarButtomItem = UIBarButtonItem(customView: shareButton)
        let favoritesBarButtomItem = UIBarButtonItem(customView: favoritesButton)

        navigationItem.leftBarButtonItem = backBarButtomItem
        navigationItem.rightBarButtonItems = [favoritesBarButtomItem, shareBarButtomItem]
    }

    @objc private func backToTheLastController() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - DetailRecipesViewController + DetailRecipesViewProtocol

extension DetailRecipesViewController: DetailRecipesViewProtocol {
    func getDetailRecipes(detail: RecipesStorage) {
        detailRecipes = detail
    }

    func setTittle() {
        tittleLabel.text = detailRecipes?.dishLabel
    }
}

// MARK: - DetailRecipesViewController + UITableViewDataSource

extension DetailRecipesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch informationTypes[indexPath.row] {
        case .picture:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.pictureOfDiskIdentifier,
                for: indexPath
            ) as? PictureOfDishCell else { return UITableViewCell() }
            if let image = detailRecipes?.dishImage {
                cell.setupImage(image)
            }
            return cell
        case .calorie:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.caloriesIdentifier,
                for: indexPath
            ) as? CalorieCell else { return UITableViewCell() }
            cell.setupView()
            return cell
        case .description:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.recipeDescriptionIdentifier,
                for: indexPath
            ) as? RecipeDescriptionCell else { return UITableViewCell() }
            // cell.setupText(textForRecipes)
            cell.setupText(descriptions.description.textDescription)
            return cell
        }
    }
}

// MARK: - DetailRecipesViewController + UITableViewDelegate

extension DetailRecipesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch informationTypes[indexPath.row] {
        case .picture:
            return 305
        case .calorie:
            return 80
        case .description:
            // return UITableView.automaticDimension
            return 630
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}
