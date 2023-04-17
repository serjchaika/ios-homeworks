import UIKit

class PhotosTableViewCell: UITableViewCell {

    // MARK: - Subviews

    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.contentMode = .center
        imageView.clipsToBounds = false
        let imageIcon = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        imageView.image = imageIcon

        return imageView
    }()

    private lazy var photosTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.systemFont(ofSize: Constants.bigTitleFontSize, weight: .bold)
        label.textColor = .black
        label.text = Constants.photosSectionTitle

        return label
    }()

    private lazy var photosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white

        stackView.clipsToBounds = true

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = Constants.halfModuleSize

        return stackView
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
        selectionStyle = .none
    }

    private func addSubviews() {
        contentView.addSubview(photosTitleLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(photosStackView)
    }

    private func setConstraints() {

        NSLayoutConstraint.activate([
            photosTitleLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.innerPaddings
            ),
            photosTitleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.innerPaddings
            ),
        ])

        NSLayoutConstraint.activate([
            arrowImageView.centerYAnchor.constraint(
                equalTo: photosTitleLabel.centerYAnchor
            ),
            arrowImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.innerPaddings
            ),
        ])

        let bottomConstraint = photosStackView.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor,
            constant: -Constants.innerPaddings
        )
        // чтобы погасить предупреждения о констрейнтах в логах
        bottomConstraint.priority = UILayoutPriority(rawValue: 999)

        NSLayoutConstraint.activate([
            photosStackView.topAnchor.constraint(
                equalTo: photosTitleLabel.bottomAnchor,
                constant: Constants.innerPaddings
            ),
            photosStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.innerPaddings
            ),
            photosStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.innerPaddings
            ),
            photosStackView.heightAnchor.constraint(
                equalTo: photosStackView.widthAnchor,
                multiplier: 0.25
            ),
            bottomConstraint
        ])

    }

    func pushContent(_ model: ArraySlice<Photo>) {
        model.forEach { onePhoto in
            let photoImageView = UIImageView()
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
            photoImageView.layer.cornerRadius = 6.0
            photoImageView.image = UIImage(named: onePhoto.fileName)

            photosStackView.addArrangedSubview(photoImageView)
        }
    }

}
