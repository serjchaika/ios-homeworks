import UIKit

final class PostViewController: UIViewController {

    private lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(addButtonTapped)
        )
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = addButton
    }

    @objc private func addButtonTapped() {
        let infoViewController = InfoViewController()

        infoViewController.modalTransitionStyle = .coverVertical
        infoViewController.modalPresentationStyle = .pageSheet

        present(infoViewController, animated: true)
    }

}
