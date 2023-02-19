import UIKit

final class FeedViewController: UIViewController {

    private let getPostButton: UIButton = {
        let button = UIButton()

        if #available(iOS 15.0, *) {
            button.configuration = .filled()
            button.configuration?.baseBackgroundColor = .black
        } else {  }

        button.setTitle("Read more", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .systemGray5
        makeUI()
    }

    struct Post {
        var title: String
    }

    func makeUI() {
        view.addSubview(getPostButton)

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            getPostButton.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 24
            ),
            getPostButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 16
            ),
            getPostButton.widthAnchor.constraint(equalToConstant: 140),
            getPostButton.heightAnchor.constraint(equalToConstant: 36)
        ])

        getPostButton.addTarget(self, action: #selector(postButtonPressed(_:)), for: .touchUpInside)
    }

    @objc private func postButtonPressed(_ sender: UIButton) {
        let postView = PostViewController()
        let postItem = Post(title: "Hello, World!")
        postView.title = postItem.title
        navigationController?.pushViewController(postView, animated: true)
    }
}
