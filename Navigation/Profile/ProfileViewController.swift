import UIKit

final class ProfileViewController: UIViewController {

    fileprivate let data = Post.pull()

    private enum CellReuseID: String {
        case postCell = "postTableViewCell_ReuseID"
        case headerCell = "headerTableViewCell_ReuseID"
    }

    // MARK: - Subviews

    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.keyboardDismissMode = .onDrag

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = UIEdgeInsets(
            top: 0,
            left: Constants.moduleSize,
            bottom: 0,
            right: Constants.moduleSize
        )

        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        addSubviews()
        setConstraints()
        configureTableView()
    }

    // MARK: - Private

    private func configureView() {
        view.backgroundColor = .white
    }

    private func addSubviews() {
        view.addSubview(tableView)
    }

    private func setConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor
            ),
            tableView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor
            )
        ])
    }

    private func configureTableView() {
        tableView.estimatedRowHeight = 500.0
        tableView.rowHeight = UITableView.automaticDimension

        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.postCell.rawValue
        )

        tableView.register(
            PostTableViewHeader.self,
            forHeaderFooterViewReuseIdentifier: CellReuseID.headerCell.rawValue
        )

        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Extension

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseID.postCell.rawValue,
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }

        cell.update(data[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: CellReuseID.headerCell.rawValue
        ) as? PostTableViewHeader else {
            fatalError("could not dequeueReusableHeaderCell")
        }

        return view
    }

}

extension ProfileViewController: UITableViewDelegate {

}
