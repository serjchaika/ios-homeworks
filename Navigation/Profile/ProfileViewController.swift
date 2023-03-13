import UIKit

final class ProfileViewController: UIViewController {

    private lazy var profileView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
        return view
    }()

    private lazy var goButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.profileTitle
        view.backgroundColor = .white
        view.addSubview(profileView)
        view.addSubview(goButton)
        makeUI()
    }

    private func makeUI() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor
            ),
            profileView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor
            ),
            profileView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor
            ),
            profileView.heightAnchor.constraint(
                equalToConstant: 220.0
            ),

            goButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 0.0
            ),
            goButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: 0.0
            ),
            goButton.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor
            ),
            goButton.heightAnchor.constraint(
                equalToConstant: 50.0
            ),
        ])
    }
}
