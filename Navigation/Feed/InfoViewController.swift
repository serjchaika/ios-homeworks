import UIKit

final class InfoViewController: UIViewController {

    private let alertButton: UIButton = {
        let button = UIButton()

        if #available(iOS 15.0, *) {
            button.configuration = .filled()
            button.configuration?.baseBackgroundColor = .systemPink
        } else {  }

        button.setTitle("Show Alert", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        makeUI()
    }

    func makeUI() {
        view.addSubview(alertButton)

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            alertButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            alertButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            alertButton.widthAnchor.constraint(equalToConstant: 140),
            alertButton.heightAnchor.constraint(equalToConstant: 36)
        ])

        alertButton.addTarget(self, action: #selector(alertPressed(_:)), for: .touchUpInside)
    }

    @objc private func alertPressed(_ sender: UIButton) {

        let alert = UIAlertController(title: "Rapid quiz", message: "How are you feeling today?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Good", style: .cancel, handler: { _ in print("Good") }))
        alert.addAction(UIAlertAction(title: "Not bad", style: .default, handler: { _ in print("Not bad") }))

        self.present(alert, animated: true, completion: nil)
    }

}
