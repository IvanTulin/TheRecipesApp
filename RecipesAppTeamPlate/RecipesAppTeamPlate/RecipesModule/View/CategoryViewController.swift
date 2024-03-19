// CategoryViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс общения с RecipesView
protocol CategoryViewProtocol: AnyObject {
    func setTittle(_ nameTitle: String)
    // func getRecipes(recipes: RecipesInfo)
    func getRecipes(recipes: [RecipeCommonInfo])
    func sendCommand()
    func updateStateView()
    func launchShimmer()
}

/// Экран выбранной категории
class CategoryViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let identifier = "RecipecViewCell"
        static let identifierForEmptyCell = "EmptyCell"
        static let tabBarPlaceHolder = "Search recipes"
        static let font = "Verdana-Bold"
        static let bigSize = 28
        static let calories = "Calories"
        static let filterIconImage = UIImage(named: "filterIcon")
        static let time = "Time"
    }

    let commandExecutor = CommandExecutor()
    let categoriesSrceenReceiver = CategoriesSrceenReceiver()

    // MARK: - Visual Components

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)

        return refreshControl
    }()

    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = Constants.tabBarPlaceHolder
        search.searchTextField.borderStyle = .none
        search.searchBarStyle = .minimal
        search.searchTextField.backgroundColor = .appLightGray
        search.searchTextField.layer.cornerRadius = 12
        search.sizeToFit()
        search.delegate = self
        return search
    }()

    private lazy var backButton: UIButton = {
        let customButton = UIButton(type: .custom)
        customButton.setImage(.backButton, for: .normal)
        // customButton.setTitle("riiiiiky", for: .normal)
        customButton.titleLabel?.font = UIFont(name: Constants.font, size: CGFloat(Constants.bigSize))
        customButton.setTitleColor(.black, for: .normal)
        customButton.addTarget(self, action: #selector(backToTheLastController), for: .touchUpInside)
        return customButton
    }()

    private lazy var caloriesFilterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.calories, for: .normal)
        button.layer.cornerRadius = 20
        button.setImage(Constants.filterIconImage, for: .normal)
        button.backgroundColor = UIColor(red: 242 / 255, green: 245 / 255, blue: 250 / 255, alpha: 1.0)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 10)
        button.addTarget(self, action: #selector(caloriesButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var timeFilterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.time, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .appPaleBlue
        return button
    }()

    lazy var recipesTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.refreshControl = refreshControl
        table.register(RecipesViewCell.self, forCellReuseIdentifier: Constants.identifier)
        table.register(EmptyCell.self, forCellReuseIdentifier: Constants.identifierForEmptyCell)
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.reloadData()
        return table
    }()

    deinit {
        print("CategoryViewController deinit")
    }

    // MARK: - Puplic Properties

    var presenter: CategoryPresenter!
    var recipesNetwork: [RecipeCommonInfo]?
    var searchRecipes: [RecipeCommonInfo] = []
    var searching = false
    var networkservice = NetworkService()

    // MARK: - Private Properties

    private var stateShimer = StateShimer.initial

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getRecipe()
        configureAllUI()
        presenter.getCommand()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.restartShimmer()

//        switch presenter.state {
//        case .loading:
//            stateShimer = .shimmer
//            recipesTableView.showShimmer()
//            recipesTableView.reloadData()
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
//                guard let self = self else { return }
//                self.stateShimer = .loaded
//                if let data = self.recipesNetwork?.first {
//                    self.presenter.state = .data(data)
//                }
//                self.recipesTableView.reloadData()
//                self.recipesTableView.hideShimmer()
//            }
//        default: break
//        }

//        switch stateShimer {
//        case .initial:
//            stateShimer = .shimmer
//            recipesTableView.showShimmer()
//            recipesTableView.reloadData()
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                self.stateShimer = .loaded
//                self.recipesTableView.reloadData()
//                self.recipesTableView.hideShimmer()
//
//                // self.presenter?.getRecipe()
//            }
//        default: break
//        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getRecipe()
        tabBarController?.tabBar.isHidden = false
    }

    // MARK: - Private Methods

    private func configureAllUI() {
        view.backgroundColor = .white
        view.addSubview(recipesTableView)
        view.addSubview(caloriesFilterButton)
        view.addSubview(timeFilterButton)
        view.addSubview(searchBar)
        // presenter.getTittle()
        configureNavigation()
        presenter.getRecipe()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
//        if let nameRecipes = recipes?.nameRecipesLabel {
//            backButton.setTitle(" \(nameRecipes)", for: .normal)
//        }
        if let nameRecipes = recipesNetwork?.first?.label {
            backButton.setTitle(" \(nameRecipes)", for: .normal)
        }

        setupSearchBar()
        setupTableView()
        setupCaloriesButton()
        setupTimeButton()
    }

    private func setupTimeButton() {
        timeFilterButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30).isActive = true
        timeFilterButton.leadingAnchor.constraint(equalTo: caloriesFilterButton.trailingAnchor, constant: 11)
            .isActive = true
        timeFilterButton.widthAnchor.constraint(equalToConstant: 112).isActive = true
        timeFilterButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }

    private func setupCaloriesButton() {
        caloriesFilterButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30).isActive = true
        caloriesFilterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        caloriesFilterButton.widthAnchor.constraint(equalToConstant: 112).isActive = true
        caloriesFilterButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }

    private func setupSearchBar() {
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        searchBar.widthAnchor.constraint(equalToConstant: 348).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }

    private func setupTableView() {
        recipesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        recipesTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 76).isActive = true
        recipesTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        recipesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    private func configureNavigation() {
        let customBarButtomItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBarButtomItem
    }

    @objc private func backToTheLastController() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func refresh(sender: UIRefreshControl) {
        presenter.state = .loading
        presenter.restartShimmer()
        sender.endRefreshing()
    }

    @objc private func caloriesButtonTapped() {
//        recipePresenter?.buttonCaloriesChange(category: recipes?.recepies ?? [])
    }
}

// MARK: - CategoryViewController + CategoryViewProtocol

extension CategoryViewController: CategoryViewProtocol {
    func getRecipes(recipes: [RecipeCommonInfo]) {
        // self.recipes = recipes
        recipesNetwork = recipes
        recipesTableView.reloadData()
    }

    func setTittle(_ nameTitle: String) {}

    func sendCommand() {
        commandExecutor.addCommand(command: categoriesSrceenReceiver)
        commandExecutor.makeRecord()
    }

    func updateStateView() {
        switch presenter.state {
        case .loading, .data:
            recipesTableView.reloadData()
        case .noData:
            return
        case .error:
            return
        }
    }

    func launchShimmer() {
        switch presenter.state {
        case .loading:
            stateShimer = .shimmer
            recipesTableView.showShimmer()
            recipesTableView.reloadData()

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                guard let self = self else { return }
                self.stateShimer = .loaded
//                if let data = self.recipesNetwork?.first {
//                    self.presenter.state = .data(data)
//                }
                if let data = self.recipesNetwork {
                    self.presenter.state = .data(data)
                }
                self.recipesTableView.reloadData()
                self.recipesTableView.hideShimmer()
            }
        default: break
        }
    }
}

// MARK: - Extension + UITableViewDataSource

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch presenter.state {
        case .loading:
            9
        case .data:
            recipesNetwork?.count ?? 0
        case .noData, .error:
            0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.identifier,
            for: indexPath
        ) as? RecipesViewCell
        else { return UITableViewCell() }

        switch presenter.state {
        case .loading:
            stateShimer = .shimmer
            cell.deleteRecipes()
        case let .data(recipes):
            stateShimer = .loaded
            print("recipes.count: \(recipes.count)")
            print("recipesNetwork.count: \(recipesNetwork?.count)")
//            guard let data = recipesNetwork?[indexPath.row] else { return cell }
//            recipes = data
            cell.getRecipes(recipe: recipes[indexPath.row])
            cell.buttonChangeHandler = { [weak self] in
                guard let self = self else { return }
                presenter.showDetails(recipes[indexPath.row])
            }
        case .noData, .error:
            break
        }

//        switch stateShimer {
//        case .initial:
//            cell.deleteRecipes()
//        case .shimmer:
//            cell.deleteRecipes()
//        case .loaded:
        ////            guard let cell1 = recipes?.storageRecipes[indexPath.row] else { return cell }
//            guard let cell1 = recipesNetwork?[indexPath.row] else { return cell }
//            cell.getRecipes(recipe: cell1)
//            cell.buttonChangeHandler = { [weak self] in
//
//                guard let self = self else { return }
//                presenter.showDetails(cell1)
//            }
//        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        115
    }
}

// MARK: - Extension + UISearchBarDelegate

extension CategoryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            let searchFiltered = recipesNetwork?
                .filter { $0.label.prefix(searchText.count) == searchText }
            recipesNetwork = searchFiltered ?? []
            recipesTableView.reloadData()
        } else {
            recipesNetwork = searchRecipes
            recipesTableView.reloadData()
        }
    }
}
