import UIKit

class PhotosViewController: UIViewController {

    // MARK: - Data

    fileprivate lazy var photos: [Photo] = Photo.pull()

    private enum CellReuseID: String {
        case photosCell = "photoCollectionViewCell_ReuseID"
    }


    // MARK: - Subviews

    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        addSubviews()
        setConstraints()
        configureCollectionView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    // MARK: - Private

    private func configureView() {
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        title = Constants.photoGalleryTitle
    }

    private func addSubviews() {
        view.addSubview(collectionView)
    }

    private func setConstraints() {

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }

    private func configureCollectionView() {
        collectionView.register(
            PhotosCollectionViewCell.self,
            forCellWithReuseIdentifier: CellReuseID.photosCell.rawValue
        )

        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

// MARK: - Extensions

extension PhotosViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CellReuseID.photosCell.rawValue,
            for: indexPath) as! PhotosCollectionViewCell

        let photos = photos[indexPath.row]
        cell.update(with: photos)

        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    private func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 3
        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return floor(finalWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = itemWidth(for: view.frame.width, spacing: Constants.halfModuleSize)
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(
            top: Constants.halfModuleSize,
            left: Constants.halfModuleSize,
            bottom: Constants.halfModuleSize,
            right: Constants.halfModuleSize
        )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.halfModuleSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.halfModuleSize
    }
}
