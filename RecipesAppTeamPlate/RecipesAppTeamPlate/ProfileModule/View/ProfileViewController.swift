// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс общения с ProfileViewController
protocol ProfileViewProtocol: AnyObject {
    /// показываем алерт для смены имени пользователя
    func showChangeNameAlert()
    /// устанавливаем новое имя пользователю
    func setNewNameFromSource()
    ///  Показать экрана Условия конфидициальности
    func showTermsOfConfidentialityController()
}

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let nameTitle = "Profile"
        static let nameFontBold = "Verdana-Bold"
        static let avatarIdentifier = "AvatarCell"
        static let userNameIdentifier = "UserNameCell"
        static let controlPanelIdentifier = "ControlPanelCell"
        static let nameSurname = "Name Surname"
        static let alertText = "Change your name and surname"
        static let cancelButtonText = "Cancel"
        static let okButtonText = "OK"
    }

    /// Тип данных
    enum InformationType {
        /// avatar профиля
        case avatar
        /// имя пользователя
        case userName
        /// посты
        case controlPanel
    }

    /// Cостояние карты
    enum CardState {
        /// увеличенное
        case expanded
        /// уменьшенныый
        case reduced
    }

    /// высота экрана
    let cardHieight: CGFloat = 670
    /// высота уменьшенного экрана
    let cardHandleAreaHeight: CGFloat = 125

    let informationTypes: [InformationType] = [.avatar, .userName, .controlPanel]

    // MARK: - Visual Components

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        tableView.register(
            AvatarCell.self,
            forCellReuseIdentifier: Constants.avatarIdentifier
        )
        tableView.register(
            UserNameCell.self,
            forCellReuseIdentifier: Constants.userNameIdentifier
        )
        tableView.register(
            ControlPanelCell.self,
            forCellReuseIdentifier: Constants.controlPanelIdentifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Puplic Properties

    var presenter: ProfilePresenter?

    var termsViewController: TermsOfConfidentialityViewController!
    var profileViewcontroller: ProfileViewController!
    var visualEffectView: UIVisualEffectView!
    var cardVisible = false
    var nextState: CardState {
        cardVisible ? .reduced : .expanded
    }

    var runningAnimations: [UIViewPropertyAnimator] = []
    var animationProgressWhenInterrupted: CGFloat = 0

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = UIColor.rgba(red: 255, green: 255, blue: 255, alfa: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = Constants.nameTitle
    }

    private func configureTableView() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func setNewName(_ newName: String) {
        presenter?.didSubmitNewName(newName)
    }

    private func setupCard() {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = view.frame
        view.addSubview(visualEffectView)

        termsViewController = TermsOfConfidentialityViewController()
        if let text = presenter?.getTextDescription() {
            termsViewController.setupText(text)
        }
        addChild(termsViewController)
        view.addSubview(termsViewController.view)

        termsViewController.view.frame = CGRect(
            x: 0,
            y: view.frame.height - cardHandleAreaHeight,
            width: view.bounds.width,
            height: cardHieight
        )
        termsViewController.view.clipsToBounds = true

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(recognizer:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleCardPan(recognizer:)))

        termsViewController.controlLineView.addGestureRecognizer(tapGestureRecognizer)
        termsViewController.controlLineView.addGestureRecognizer(panGestureRecognizer)
    }

    private func animateTransitionIfNeeded(state: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) { [weak self] in
                guard let self = self else { return }
                switch state {
                case .expanded:
                    self.termsViewController.view.frame.origin.y = self.view.frame.height - self.cardHieight
                case .reduced:
                    self.termsViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                }
            }
            frameAnimator.addCompletion { [weak self] _ in
                guard let self = self else { return }
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }

            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)

            /// создаем анимацию сгругдения углов
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) { [weak self] in
                guard let self = self else { return }
                switch state {
                case .expanded:
                    self.termsViewController.view.layer.cornerRadius = 12
                case .reduced:
                    self.termsViewController.view.layer.cornerRadius = 0
                }
            }

            cornerRadiusAnimator.startAnimation()
            runningAnimations.append(cornerRadiusAnimator)

            let blurAnimation = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.visualEffectView.effect = UIBlurEffect(style: .dark)
                case .reduced:
                    self.visualEffectView.effect = nil
                }
            }
            blurAnimation.startAnimation()
            runningAnimations.append(blurAnimation)
        }
    }

    private func startInteractiveTransition(state: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animatior in runningAnimations {
            animatior.pauseAnimation()
            animationProgressWhenInterrupted = animatior.fractionComplete
        }
    }

    private func updateInteractiveTransition(fractionCompleted: CGFloat) {
        for animatior in runningAnimations {
            animatior.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }

    private func continueInteractiveTransition() {
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }

    @objc private func handleCardTap(recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }

    @objc private func handleCardPan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            /// управляем свайпом вверх/вниз
            let transition = recognizer.translation(in: termsViewController.controlLineView)
            var fractionComplete = transition.y / cardHieight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
            navigationController?.isNavigationBarHidden = true
            tabBarController?.tabBar.isHidden = true
        // updateInteractiveTransition(fractionCompleted: 0)
        case .ended:
            continueInteractiveTransition()
            navigationController?.isNavigationBarHidden = false
            tabBarController?.tabBar.isHidden = false
        default:
            break
        }
    }
}

// MARK: - ProfileViewController + UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        informationTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch informationTypes[indexPath.section] {
        case .avatar:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.avatarIdentifier,
                for: indexPath
            ) as? AvatarCell else { return UITableViewCell() }
            guard let userInfo = presenter?.getUserInformation() else { return cell }
            cell.setUserInformation(userInfo) {}
            return cell
        case .userName:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.userNameIdentifier,
                for: indexPath
            ) as? UserNameCell else { return UITableViewCell() }
            guard let userInfo = presenter?.getUserInformation() else { return cell }
            cell.setUserInformation(userInfo) { [weak self] in
                self?.presenter?.actionChangeName()
            }
            return cell
        case .controlPanel:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.controlPanelIdentifier,
                for: indexPath
            ) as? ControlPanelCell else { return UITableViewCell() }
            cell.onEditButtonTapped = { [weak self] in
                guard let self = self else { return }
                self.presenter?.showBonusesViewController()
            }
            cell.onSetupCard = {
                self.presenter?.showTermsOfConfidentiality()
            }
            return cell
        }
    }
}

// MARK: - ProfileViewController + UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch informationTypes[indexPath.section] {
        case .avatar:
            return 180
        case .userName:
            return 31
        case .controlPanel:
            return 390
        }
    }
}

// MARK: - ProfileViewController + ProfileViewProtocol

extension ProfileViewController: ProfileViewProtocol {
    func showChangeNameAlert() {
        let alert = UIAlertController(title: Constants.alertText, message: nil, preferredStyle: .alert)
        alert.addTextField { text in
            text.placeholder = Constants.nameSurname
        }
        let actionOK = UIAlertAction(title: Constants.okButtonText, style: .cancel) { _ in
            guard let newName = alert.textFields?[0].text else { return }
            self.setNewName(newName)
        }
        let actionCancel = UIAlertAction(title: Constants.cancelButtonText, style: .default)

        alert.addAction(actionOK)
        alert.addAction(actionCancel)

        present(alert, animated: true)
    }

    func setNewNameFromSource() {
        tableView.reloadData()
    }

    func showTermsOfConfidentialityController() {
        setupCard()
    }
}
