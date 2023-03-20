import UIKit

final class PostTableViewCell: UITableViewCell {

    // MARK: - Subviews

    private lazy var postTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: Constants.titleFontSize, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 3

        return label
    }()

    private lazy var postTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: Constants.smallFontSize, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0

        return label
    }()

    private lazy var postLikesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: Constants.normalFontSize, weight: .regular)
        label.textColor = .black

        return label
    }()

    private lazy var postViewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: Constants.normalFontSize, weight: .regular)
        label.textColor = .black

        return label
    }()

    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black

        return imageView
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureView()
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private func configureView() {
        contentView.backgroundColor = .white
        accessoryType = .none
        accessoryView = nil
        selectionStyle = .none
    }

    private func addSubviews() {
        contentView.addSubview(postTitleLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(postTextLabel)
        contentView.addSubview(postLikesLabel)
        contentView.addSubview(postViewsLabel)
    }

    private func setConstraints() {

        NSLayoutConstraint.activate([
            postTitleLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.moduleSize
            ),
            postTitleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.moduleSize
            ),
            postTitleLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.moduleSize
            )
        ])

        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(
                equalTo: postTitleLabel.bottomAnchor,
                constant: Constants.moduleSize - 4
            ),
            postImageView.widthAnchor.constraint(
                equalTo: contentView.widthAnchor
            ),
            postImageView.heightAnchor.constraint(
                equalTo: contentView.widthAnchor
            ),
            postImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            postImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
        ])

        NSLayoutConstraint.activate([
            postTextLabel.topAnchor.constraint(
                equalTo: postImageView.bottomAnchor,
                constant: Constants.moduleSize
            ),
            postTextLabel.leadingAnchor.constraint(
                equalTo: postTitleLabel.leadingAnchor
            ),
            postTextLabel.trailingAnchor.constraint(
                equalTo: postTitleLabel.trailingAnchor
            )
        ])

        NSLayoutConstraint.activate([
            postLikesLabel.topAnchor.constraint(
                equalTo: postTextLabel.bottomAnchor,
                constant: Constants.moduleSize
            ),
            postLikesLabel.leadingAnchor.constraint(
                equalTo: postTitleLabel.leadingAnchor
            ),
            postLikesLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Constants.moduleSize
            )
        ])

        NSLayoutConstraint.activate([
            postViewsLabel.topAnchor.constraint(
                equalTo: postTextLabel.bottomAnchor,
                constant: Constants.moduleSize
            ),
            postViewsLabel.trailingAnchor.constraint(
                equalTo: postTitleLabel.trailingAnchor
            )
        ])
    }

    // MARK: - Public

    func update(_ model: Post) {
        postTitleLabel.text = model.author
        postImageView.image = UIImage(named: model.image)
        postTextLabel.text = model.description
        postLikesLabel.text = "Likes: \(model.likes)"
        postViewsLabel.text = "Views: \(model.views)"
    }

}
