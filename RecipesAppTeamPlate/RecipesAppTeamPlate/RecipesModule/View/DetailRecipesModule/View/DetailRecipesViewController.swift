// DetailRecipesViewController.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Интерфейс общения с DetailRecipesViewController
protocol DetailRecipesViewProtocol: AnyObject {
    ///  Презентер экрана
    var presenter: DetailRecipesPresenter? { get set }

    /// Получить данные с хранилища
    func getDetailRecipes(detail: RecipeCommonInfo)

    func getDetailRecipesNetwork(detail: RecipeDetail)

    func reloadDataTableView()
    /// Установить титл
    func setTittle()
    /// Отправить команду
    func sendCommand()
    /// Отправить команду для отправителя рецепта
    func sendCommandForShare()
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
    let commandExecutor = CommandExecutor()
    let detailRecipesReceiver = DetailRecipesReceiver()
    let sharedRecipesReceiver = SharedRecipesReceiver()

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

    private lazy var favoritesButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(.favorites, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(addInFavorite), for: .touchUpInside)
        return button
    }()

    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(sendRecipe), for: .touchUpInside)
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

    deinit {
        print("DetailRecipesViewController deinit")
    }

    // MARK: - Public Methods

    var presenter: DetailRecipesPresenter?
    var detailRecipes: RecipeCommonInfo?
    var detailRecipesNetwork: RecipeDetail?
    var descriptions = Description()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDetailRecipes()
        presenter?.getParseDetailRecipes()
        configureTableView()
        configureNavigation()
        presenter?.getTextForTittle()
        presenter?.getCommand()
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

    @objc private func sendRecipe() {
        presenter?.getCommandForShare()
    }

    @objc private func addInFavorite() {
//        let service = FavoriteService.service
//        if let detailRecipes = detailRecipes {
//            service.favoriteRecipes.append(detailRecipes)
//        }
    }
}

// MARK: - DetailRecipesViewController + DetailRecipesViewProtocol

extension DetailRecipesViewController: DetailRecipesViewProtocol {
    func reloadDataTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }

    func getDetailRecipes(detail: RecipeCommonInfo) {
        detailRecipes = detail
        presenter?.reloadData()
    }

    func getDetailRecipesNetwork(detail: RecipeDetail) {
        detailRecipesNetwork = detail
        presenter?.reloadData()
    }

    func setTittle() {
        // tittleLabel.text = detailRecipes?.label
        tittleLabel.text = detailRecipesNetwork?.label
        presenter?.reloadData()
    }

    func sendCommand() {
        commandExecutor.addCommand(command: detailRecipesReceiver)
        commandExecutor.makeRecord()
    }

    func sendCommandForShare() {
        commandExecutor.addCommand(command: sharedRecipesReceiver)
        commandExecutor.makeRecord()
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
//            if let image = detailRecipes {
//                cell.setupImage(image)
//            }
            if let image = detailRecipesNetwork {
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
