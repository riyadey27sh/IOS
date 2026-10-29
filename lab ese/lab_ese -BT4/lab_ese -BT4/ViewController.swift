
import UIKit

class ViewController: UIViewController {

    private let usernameField = UITextField()
    private let passwordField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginScreen()
    }

    private func setupLoginScreen() {
        view.backgroundColor = .white
        title = "Login"
        navigationController?.navigationBar.prefersLargeTitles = true

        usernameField.placeholder = "Username"
        usernameField.borderStyle = .roundedRect
        usernameField.autocapitalizationType = .none
        usernameField.autocorrectionType = .no
        usernameField.accessibilityLabel = "Username"

        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        passwordField.accessibilityLabel = "Password"

        let loginButton = makeButton(
            title: "Log In",
            action: #selector(loginTapped)
        )

        let forgotUsernameButton = makeButton(
            title: "Forgot Username?",
            action: #selector(forgotUsernameTapped)
        )

        let forgotPasswordButton = makeButton(
            title: "Forgot Password?",
            action: #selector(forgotPasswordTapped)
        )

        let fieldsStack = UIStackView(
            arrangedSubviews: [
                usernameField,
                passwordField,
                loginButton
            ]
        )
        fieldsStack.axis = .vertical
        fieldsStack.spacing = 14
        fieldsStack.translatesAutoresizingMaskIntoConstraints = false

        let helpStack = UIStackView(
            arrangedSubviews: [
                forgotUsernameButton,
                forgotPasswordButton
            ]
        )
        helpStack.axis = .horizontal
        helpStack.distribution = .equalSpacing
        helpStack.spacing = 12
        helpStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(fieldsStack)
        view.addSubview(helpStack)

        NSLayoutConstraint.activate([
            fieldsStack.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 28
            ),
            fieldsStack.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -28
            ),
            fieldsStack.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: -20
            ),

            helpStack.topAnchor.constraint(
                equalTo: fieldsStack.bottomAnchor,
                constant: 18
            ),
            helpStack.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            usernameField.heightAnchor.constraint(equalToConstant: 44),
            passwordField.heightAnchor.constraint(equalToConstant: 44),
            loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func makeButton(
        title: String,
        action: Selector
    ) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(
            self,
            action: action,
            for: .touchUpInside
        )
        return button
    }

    @objc private func loginTapped() {
        guard let username = usernameField.text?
            .trimmingCharacters(in: .whitespacesAndNewlines),
              !username.isEmpty else {
            showAlert(
                title: "Username Required",
                message: "Please enter your username."
            )
            return
        }

        guard let password = passwordField.text,
              !password.isEmpty else {
            showAlert(
                title: "Password Required",
                message: "Please enter your password."
            )
            return
        }

        let landingVC = LandingViewController()
        landingVC.username = username
        landingVC.title = username

        if let navigationController = navigationController {
            navigationController.pushViewController(
                landingVC,
                animated: true
            )
        } else {
            let navigationController = UINavigationController(
                rootViewController: landingVC
            )
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true)
        }
    }

    @objc private func forgotUsernameTapped() {
        showAlert(
            title: "Forgot Username?",
            message: "Please contact your app administrator to recover your username."
        )
    }

    @objc private func forgotPasswordTapped() {
        showAlert(
            title: "Forgot Password?",
            message: "Please contact your app administrator to reset your password."
        )
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(title: "OK", style: .default)
        )
        present(alert, animated: true)
    }
}
