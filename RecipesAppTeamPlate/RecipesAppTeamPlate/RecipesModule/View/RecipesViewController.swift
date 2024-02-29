// RecipesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран рецептов
final class RecipesViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let identifierCell = "FirstDishCell"
    }
    
    // MARK: - Visual Components
    
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: Constants.identifierCell)
        collectionView.backgroundColor = .blue
        
        return collectionView
    }()

    // MARK: - Puplic Properties

    var presenter: RecipesPresenter!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCollectionView()
    }
    
    // MARK: - Private Methods
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Recipes"
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.minimumLineSpacing = 5
//        layout.minimumInteritemSpacing = 5
        return layout
    }


}

// MARK: RecipesViewController + UICollectionViewDataSource
extension RecipesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.identifierCell, for: indexPath)
        return cell
    }
}


extension RecipesViewController: UICollectionViewDelegate {
}

extension RecipesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0, 1, 7, 8:
            return CGSize(width: 185, height: 185)
        case 2, 6:
            return CGSize(width: 300, height: 300)
        default:
            return CGSize(width: 120, height: 120)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

// MARK: - RecipesViewController + RecipesViewProtocol

extension RecipesViewController: RecipesViewProtocol {}
