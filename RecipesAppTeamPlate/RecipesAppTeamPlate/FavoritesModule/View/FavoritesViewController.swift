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

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = Constants.favoritesLabel
        navigationController?.navigationBar.prefersLargeTitles = true
//        view.addSubview(emptyView)
        view.addSubview(tableView)
        // setupEmptyView()
        setupUITableView()
    }

    // MARK: - Private Methods

//    private func setupEmptyView() {
//        emptyView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        emptyView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        emptyView.widthAnchor.constraint(equalToConstant: 350).isActive = true
//        emptyView.heightAnchor.constraint(equalToConstant: 132).isActive = true
//    }

    private func setupUITableView() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: - FavoritesViewController + FavoritesViewProtocol

extension FavoritesViewController: FavoritesViewProtocol {}
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

extension FavoritesViewController: UITableViewDelegate {}
