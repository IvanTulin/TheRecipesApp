// RecipesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс общения с RecipesViewController
protocol RecipesViewProtocol: AnyObject {
    /// отправить команду
    func sendCommand()
}

/// Экран рецептов
final class RecipesViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let identifierCell = "CategoriesCell"
    }

    let commandExecutor = CommandExecutor()
    let recipesSrceenReceiver = RecipesSrceenReceiver()

    // MARK: - Visual Components

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: Constants.identifierCell)
        collectionView.backgroundColor = .white

        return collectionView
    }()

    deinit {
        print("RecipesViewController deinit")
    }

    // MARK: - Puplic Properties

    var presenter: RecipesPresenter!
    // var recipes: Recipes?
    var recipes: RecipeCommonInfo?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCollectionView()
        presenter.getCommand()
    }

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Recipes"
    }

    private func configureCollectionView() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        return layout
    }
}

// MARK: RecipesViewController + UICollectionViewDataSource

extension RecipesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.identifierCell,
            for: indexPath
        ) as? CategoriesCell else { return UICollectionViewCell() }
        guard let recipesInfo = presenter.getUserInformation() else { return cell }
        guard let recipesNetwork = presenter.getRecipesNetwork() else { return cell }
        cell.configureCell(recipesInfo[indexPath.item])
        cell.buttonChangeHandler = { [weak self] in
            guard let self = self else { return }
            // self.presenter.showCategory(recipesInfo[indexPath.item])
            /// передаем категорий, чтобы задавать в дальнейшем тип блюд через DishType
            self.presenter.showCategory(recipesNetwork[indexPath.row])
        }
        return cell
    }
}

// MARK: RecipesViewController + UICollectionViewDelegate

extension RecipesViewController: UICollectionViewDelegate {}

// MARK: RecipesViewController + UICollectionViewDelegateFlowLayout

extension RecipesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch indexPath.row {
        case 0, 1, 7, 8:
            return CGSize(width: 175, height: 175)
        case 2, 6:
            return CGSize(width: 250, height: 250)
        default:
            return CGSize(width: 110, height: 110)
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        20
    }
}

// MARK: - RecipesViewController + RecipesViewProtocol

extension RecipesViewController: RecipesViewProtocol {
    func sendCommand() {
        commandExecutor.addCommand(command: recipesSrceenReceiver)
        commandExecutor.makeRecord()
    }
}
