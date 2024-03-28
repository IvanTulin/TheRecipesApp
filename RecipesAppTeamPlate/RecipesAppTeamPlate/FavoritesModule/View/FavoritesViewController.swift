// FavoritesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран избранных рецетов
final class FavoritesViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let favoritesLabel = "Favorites"
        static let font = "Verdana-Bold"
        static let maxSize = 28
        static let emptyView = "EmptyView"
        static let identifier = "CellFavorite"
    }

    // MARK: - Visual Components

    private let emptyView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Constants.emptyView)
        return image
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.separatorColor = .clear
        table.register(RecipesViewCell.self, forCellReuseIdentifier: Constants.identifier)
        return table
    }()

    // MARK: - Puplic Properties

    var presenter: FavoritesPresenter!
//    var favorites: [RecipesStorage]?
    var favorites: [RecipeCommonInfo]?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.checkFavorite()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = Constants.favoritesLabel
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Private Methods

    private func makeTableView() {
        view.addSubview(tableView)
        setupUITableView()
        emptyView.removeFromSuperview()
    }

    private func setupUITableView() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func makeImage() {
        view.addSubview(emptyView)
        setupEmptyView()
        tableView.removeFromSuperview()
    }

    private func setupEmptyView() {
        emptyView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        emptyView.heightAnchor.constraint(equalToConstant: 132).isActive = true
    }
}

// MARK: - FavoritesViewController + FavoritesViewProtocol

extension FavoritesViewController: FavoritesViewProtocol {
    func showTableView(favoriteRecipes: [RecipesStorage]) {
        makeTableView()
        // favorites = favoriteRecipes
        tableView.reloadData()
    }

    func showImage() {
        makeImage()
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.identifier,
            for: indexPath
        ) as? RecipesViewCell
        else { return UITableViewCell() }

        guard let cell1 = favorites?[indexPath.row] else { return cell }
        cell.getRecipes(recipe: cell1)
        cell.buttonChangeHandler = { [weak self] in

//            guard let self = self else { return }
        }
        return cell
    }

    func tableView(
        _ tableView: UITableView,
        editingStyleForRowAt indexPath: IndexPath
    ) -> UITableViewCell.EditingStyle {
        .delete
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        tableView.beginUpdates()
        favorites?.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
}
