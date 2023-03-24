import UIKit

final class PostTableViewHeader: UITableViewHeaderFooterView {

    // MARK: - Subviews

    private lazy var profileView: ProfileHeaderView = {
        let profileView = ProfileHeaderView()

        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = .systemGray4

        return profileView
    }()

    // MARK: - Lifecycle

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private func addSubviews() {
        contentView.addSubview(profileView)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            profileView.heightAnchor.constraint(
                equalToConstant: 220.0
            ),
            profileView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            profileView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            profileView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            )
        ])
    }
}
