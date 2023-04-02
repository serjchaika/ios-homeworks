import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    // MARK: - Subviews

    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        configureCollectionViewCell()
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private func configureCollectionViewCell() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemGray
    }

    private func addSubviews() {
        contentView.addSubview(photoImageView)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    // MARK: - Public

    func update(with photo: Photo) {
        photoImageView.image = UIImage(named: photo.fileName)
    }
}
