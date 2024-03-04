// CategoryViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбранной категории
class CategoryViewController: UIViewController {
    // MARK: - Constants
    
    enum Constants {
       static let identifier = "RecipecViewCell"
        static let tabBarPlaceHolder = "Search recipes"
        static let font = "Verdana-Bold"
        static let bigSize = 28
        static let calories = "Calories"
        static let time = "Time"
    }
    
    // MARK: - Visual Components

    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = Constants.tabBarPlaceHolder
        search.searchTextField.borderStyle = .none
        search.searchBarStyle = .minimal
        search.searchTextField.backgroundColor = .appLightGray
        search.searchTextField.layer.cornerRadius = 12
        return search
    }()

    lazy var backButton: UIButton = {
        let customButton = UIButton(type: .custom)
        customButton.setImage(.backButton, for: .normal)
        customButton.titleLabel?.font = UIFont(name: Constants.font, size: CGFloat(Constants.bigSize))
        customButton.setTitleColor(.black, for: .normal)
        customButton.addTarget(self, action: #selector(backToTheLastController), for: .touchUpInside)
        return customButton
    }()

    lazy var caloriesFilterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.calories, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .recipeCell
        return button
    }()
    lazy var timeFilterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.time, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .appPaleBlue
        return button
    }()

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(RecipesViewCell.self, forCellReuseIdentifier: Constants.identifier)
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        return table
    }()

    // MARK: - Puplic Properties

    var presenter: CategoryPresenter!
    var recipes: RecipesInfo?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        view.addSubview(tableView)
        view.addSubview(searchBar)
        view.addSubview(caloriesFilterButton)
        view.addSubview(timeFilterButton)
        // presenter.getTittle()
        configureNavigation()
        presenter.getRecipes()
        configureUI()
    }

    private func setupTimeButton() {
        timeFilterButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30).isActive = true
        timeFilterButton.leadingAnchor.constraint(equalTo: caloriesFilterButton.trailingAnchor, constant: 11).isActive = true
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
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        searchBar.widthAnchor.constraint(equalToConstant: 348).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }

    private func setupTableView() {
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 76).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    private func configureNavigation() {
        let customBarButtomItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBarButtomItem
    }

    private func configureUI() {
        backButton.setTitle(recipes?.nameRecipesLabel, for: .normal)
        setupSearchBar()
        setupTableView()
        setupCaloriesButton()
        setupTimeButton()
    }

    @objc private func backToTheLastController() {
        navigationController?.popViewController(animated: true)
    }
}

extension CategoryViewController: CategoryViewProtocol {
    func getRecipes(recipes: RecipesInfo) {
        self.recipes = recipes
    }

    func setTittle(_ nameTitle: String) {
    }
}

extension CategoryViewController: UITableViewDelegate {}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes?.storageRecipes.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier, for: indexPath) as? RecipesViewCell
        else { return UITableViewCell() }
        guard let cell1 = recipes?.storageRecipes[indexPath.row] else { return cell }
        cell.getRecipes(recipe: cell1)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        115
    }
}
