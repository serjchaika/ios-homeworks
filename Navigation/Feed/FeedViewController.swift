import UIKit
import StorageService

final class FeedViewController: UIViewController {

    private let getPostButton: UIButton = {
        let button = UIButton()

        if #available(iOS 15.0, *) {
            button.configuration = .filled()
            button.configuration?.baseBackgroundColor = .black
        } else {  }

        button.setTitle("Read more", for: .normal)
        button.setTitleColor(.white, for: .normal)

        return button
    }()

    private let getAnotherPostButton: UIButton = {
        let button = UIButton()

        if #available(iOS 15.0, *) {
            button.configuration = .filled()
            button.configuration?.baseBackgroundColor = .black
        } else {  }

        button.setTitle("Read one more", for: .normal)
        button.setTitleColor(.white, for: .normal)

        return button
    }()


    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true

        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10.0

        stackView.addArrangedSubview(self.getPostButton)
        stackView.addArrangedSubview(self.getAnotherPostButton)

        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.feedTitle
        view.backgroundColor = .white

        view.addSubview(buttonStackView)

        getPostButton.addTarget(
            self,
            action: #selector(postButtonPressed(_:)),
            for: .touchUpInside
        )
        getAnotherPostButton.addTarget(
            self,
            action: #selector(postButtonPressed(_:)),
            for: .touchUpInside
        )

        makeUI()
    }

    private func makeUI() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerXAnchor
            ),
            buttonStackView.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
            )
        ])
    }

    @objc private func postButtonPressed(_ sender: UIButton) {
        let postView = PostViewController()
        let postItem = Post(title: "Hello, World!")
        postView.title = postItem.title
        navigationController?.pushViewController(postView, animated: true)
    }
}
