import UIKit

final class LogInViewController: UIViewController {

    // MARK: - Subviews

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false

        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()

        contentView.translatesAutoresizingMaskIntoConstraints = false

        return contentView
    }()

    private lazy var logoImage: UIImage! = {
        let image = UIImage(named: "VKLogoImage")
        return image
    }()

    private lazy var buttonBackgroundImage: UIImage! = {
        let image = UIImage(named: "BluePixel")
        return image
    }()

    private lazy var buttonBackgroundImageAlpha: UIImage! = {
        let image = UIImage(named: "BluePixel")
        return image?.withAlpha(0.8)
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = logoImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        return imageView
    }()

    private lazy var loginTextEdit: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
        textField.returnKeyType = .next
        textField.clearButtonMode = .whileEditing
        textField.placeholder = Constants.loginPlaceholder

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true

        textField.textColor = .black
        textField.font = UIFont.systemFont(
            ofSize: Constants.normalFontSize,
            weight: .regular)
        textField.borderStyle = .none
        textField.addBottomBorder(at: Constants.loginStackSize / 2 - Constants.borderWidth)

        textField.delegate = self

        return textField
    }()

    private lazy var passwordTextEdit: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.isSecureTextEntry = true
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.placeholder = Constants.passwordPlaceholder

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true

        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: Constants.normalFontSize, weight: .regular)
        textField.borderStyle = .none

        textField.delegate = self

        return textField
    }()

    private lazy var loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true

        stackView.backgroundColor = .systemGray6
        stackView.layer.borderColor = Constants.loginBorderColor
        stackView.layer.borderWidth = Constants.borderWidth
        stackView.layer.cornerRadius = 10.0
        stackView.tintColor = UIColor(named: "AccentColor")

        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0

        stackView.addArrangedSubview(self.loginTextEdit)
        stackView.addArrangedSubview(self.passwordTextEdit)

        return stackView
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true

        button.setTitle(Constants.buttonLoginTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.setBackgroundImage(buttonBackgroundImage, for: .normal)
        button.setBackgroundImage(buttonBackgroundImageAlpha, for: .highlighted)
        button.setBackgroundImage(buttonBackgroundImageAlpha, for: .selected)
        button.setBackgroundImage(buttonBackgroundImageAlpha, for: .disabled)

        button.layer.cornerRadius = 10.0

        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addSubviews()
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupKeyboardObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeKeyboardObservers()
    }

    // MARK: - Actions

    @objc private func loginButtonPressed(_ sender: UIButton) {
        let profileView = ProfileViewController()
        navigationController?.pushViewController(profileView, animated: true)
    }

    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom = keyboardHeight ?? 0.0
    }

    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }

    // MARK: - Private

    private func configureView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(loginStackView)
        contentView.addSubview(loginButton)
    }

    private func setConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor
            ),
            scrollView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor
            )
        ])

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor
            ),
            contentView.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor
            ),
            contentView.widthAnchor.constraint(
                equalTo: scrollView.widthAnchor
            ),
            contentView.topAnchor.constraint(
                equalTo: scrollView.topAnchor
            ),
            contentView.bottomAnchor.constraint(
                equalTo: scrollView.bottomAnchor
            )
        ])

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            imageView.widthAnchor.constraint(
                equalToConstant: 100.0
            ),
            imageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 120.0
            ),
            imageView.heightAnchor.constraint(
                equalToConstant: 100.0
            )
        ])

        NSLayoutConstraint.activate([
            loginStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.moduleSize
            ),
            loginStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.moduleSize
            ),
            loginStackView.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: 120.0
            ),
            loginStackView.heightAnchor.constraint(
                equalToConstant: Constants.loginStackSize)
        ])

        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.moduleSize
            ),
            loginButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.moduleSize
            ),
            loginButton.topAnchor.constraint(
                equalTo: loginStackView.bottomAnchor,
                constant: Constants.moduleSize
            ),
            loginButton.heightAnchor.constraint(
                equalToConstant: Constants.loginStackSize / 2)
        ])

        contentView.subviews.last?.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor
        ).isActive = true
    }

    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default

        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }

}

// MARK: - Extension

extension LogInViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch (textField) {
        case loginTextEdit:
            passwordTextEdit.becomeFirstResponder()
            break
        default:
            textField.resignFirstResponder()
        }

        return true
    }
}
