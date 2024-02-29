// Login.swift
// Copyright © RoadMap. All rights reserved.

// import Foundation
//
/// Логин
struct Login {}
//
//
// enum Contstants {
//    static let topGradientColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
//    static let bottomGradientColor = UIColor(red: 222, green: 238, blue: 239, alpha: 0)
//    static let loginLabel = "Login"
//    static let fontBold = "Verdana-Bold"
//    static let font = "Verdana"
//    static let bigSize = 28
//    static let mediumSize = 18
//    static let labelColor = #colorLiteral(red: 0.2775030732, green: 0.3592622876, blue: 0.3986404538, alpha: 1)
//    static let emailLabelText = "Email Address"
//    static let placeholderEmail = "        Enter Email Address"
//    static let passwordLabelText = "Password"
//    static let placeholderPasswordTextField = "        Enter Password"
//    static let loginButtonText = "Login"
// }

// private let loginLabel: UILabel = {
//    let label = UILabel()
//    label.translatesAutoresizingMaskIntoConstraints = false
//    label.text = Contstants.loginLabel
//    label.font = UIFont(name: Contstants.fontBold, size: CGFloat(Contstants.bigSize))
//    label.textColor = Contstants.labelColor
//    return label
// }()
//
// private let emailAdressLabel: UILabel = {
//    let label = UILabel()
//    label.translatesAutoresizingMaskIntoConstraints = false
//    label.text = Contstants.emailLabelText
//    label.font = UIFont(name: Contstants.fontBold, size: CGFloat(Contstants.mediumSize))
//    label.textColor = Contstants.labelColor
//    return label
// }()
//
// private let emailTextField: UITextField = {
//    let textField = UITextField()
//    textField.translatesAutoresizingMaskIntoConstraints = false
//    textField.placeholder = Contstants.placeholderEmail
//    textField.borderStyle = .roundedRect
//    textField.indent(size: 20)
//    return textField
// }()
//
// private let passwordLabel: UILabel = {
//    let label = UILabel()
//    label.translatesAutoresizingMaskIntoConstraints = false
//    label.text = Contstants.passwordLabelText
//    label.font = UIFont(name: Contstants.fontBold, size: CGFloat(Contstants.mediumSize))
//    label.textColor = Contstants.labelColor
//    return label
// }()
//
// private let passwordTextField: UITextField = {
//    let textField = UITextField()
//    textField.translatesAutoresizingMaskIntoConstraints = false
//    textField.placeholder = Contstants.placeholderPasswordTextField
//    textField.borderStyle = .roundedRect
//    textField.indent(size: 20)
//    return textField
// }()
//
// private let eyeButton: UIButton = {
//    let button = UIButton()
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.setImage(UIImage(named: "eyeButtonImage"), for: .normal)
//    return button
// }()
//
// private let lockButton: UIButton = {
//    let button = UIButton()
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.setImage(UIImage(named: "lockButtonImage"), for: .normal)
//    return button
// }()
//
// private let mailButton: UIButton = {
//    let button = UIButton()
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.setImage(UIImage(named: "mailButtonImage"), for: .normal)
//    return button
// }()
//
// private let loginButton: UIButton = {
//    let button = UIButton()
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.setTitle(Contstants.loginButtonText, for: .normal)
//    button.layer.cornerRadius = 12
//    button.setTitleColor(.white, for: .normal)
//    button.backgroundColor = #colorLiteral(red: 0.01572173089, green: 0.14775002, blue: 0.159109056, alpha: 1)
//    return button
// }()

// private func setupUI() {
//    makeGradient()
//    view.addSubview(loginLabel)
//    view.addSubview(emailAdressLabel)
//    view.addSubview(emailTextField)
//    view.addSubview(passwordLabel)
//    view.addSubview(passwordTextField)
//    view.addSubview(eyeButton)
//    view.addSubview(lockButton)
//    view.addSubview(mailButton)
//    view.addSubview(loginButton)
//    setupConstraints()
// }
//
// private func makeGradient() {
//    let gradient = CAGradientLayer()
//    gradient.frame = view.bounds
//    gradient.colors = [Contstants.topGradientColor, Contstants.bottomGradientColor]
//    view.layer.insertSublayer(gradient, at: 0)
// }
//
// private func setupConstraints() {
//    NSLayoutConstraint.activate([
//        loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
//        loginLabel.widthAnchor.constraint(equalToConstant: 350),
//        loginLabel.heightAnchor.constraint(equalToConstant: 35)
//    ])
//    NSLayoutConstraint.activate([
//        emailAdressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        emailAdressLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//        emailAdressLabel.widthAnchor.constraint(equalToConstant: 200),
//        emailAdressLabel.heightAnchor.constraint(equalToConstant: 32)
//    ])
//    NSLayoutConstraint.activate([
//        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
//        emailTextField.widthAnchor.constraint(equalToConstant: 350),
//        emailTextField.heightAnchor.constraint(equalToConstant: 50)
//    ])
//    NSLayoutConstraint.activate([
//        passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        passwordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
//        passwordLabel.widthAnchor.constraint(equalToConstant: 200),
//        passwordLabel.heightAnchor.constraint(equalToConstant: 32)
//    ])
//    NSLayoutConstraint.activate([
//        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
//        passwordTextField.widthAnchor.constraint(equalToConstant: 350),
//        passwordTextField.heightAnchor.constraint(equalToConstant: 50)
//    ])
//    NSLayoutConstraint.activate([
//        eyeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 340),
//        eyeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 315),
//        eyeButton.widthAnchor.constraint(equalToConstant: 22),
//        eyeButton.heightAnchor.constraint(equalToConstant: 19)
//    ])
//    NSLayoutConstraint.activate([
//        lockButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
//        lockButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 315),
//        lockButton.widthAnchor.constraint(equalToConstant: 22),
//        lockButton.heightAnchor.constraint(equalToConstant: 19)
//    ])
//    NSLayoutConstraint.activate([
//        mailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
//        mailButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 205),
//        mailButton.widthAnchor.constraint(equalToConstant: 22),
//        mailButton.heightAnchor.constraint(equalToConstant: 19)
//    ])
//    NSLayoutConstraint.activate([
//        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
//        loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
//        loginButton.widthAnchor.constraint(equalToConstant: 350),
//        loginButton.heightAnchor.constraint(equalToConstant: 48)
//    ])
// }
// }
//
///// extansion for TextField. Space to the left side.
// extension UITextField {
// func indent(size: CGFloat) {
//    leftView = UIView(frame: CGRect(
//        x: frame.minX,
//        y: frame.minY,
//        width: size,
//        height: frame.height
//    ))
//    leftViewMode = .always
// }
// }
