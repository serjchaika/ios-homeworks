import UIKit

protocol ProfileViewControllerDelegate: AnyObject {
    func showLargeImageLayer()
}

final class ProfileViewController: UIViewController {

    // MARK: - Data

    fileprivate let data = Post.pull()
    fileprivate let photos = Photo.pull()

    private let stepOneAnimationDuration: CGFloat = 0.5
    private let stepTwoAnimationDuration: CGFloat = 0.3

    weak var centerXImageView: NSLayoutConstraint!
    weak var centerYImageView: NSLayoutConstraint!
    weak var heightImageView: NSLayoutConstraint!
    weak var widthImageView: NSLayoutConstraint!

    private enum CellReuseID: String {
        case postCell = "postTableViewCell_ReuseID"
        case headerCell = "headerTableViewCell_ReuseID"
        case photosCell = "photosTableViewCell_ReuseID"
    }

    // MARK: - Subviews

    private lazy var profileImageView: UIImageView = {
        let imageView = ProfileHeaderView().imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()

    private lazy var layoutView: UIView = {
        let layoutView = UIView()
        layoutView.translatesAutoresizingMaskIntoConstraints = false
        layoutView.backgroundColor = .systemGray4
        layoutView.alpha = 0

        return layoutView
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 15.0, *) {
            button.configuration = .filled()
            button.configuration?.baseBackgroundColor = .black
        } else {  }
        button.layer.cornerRadius = 4
        button.setImage(UIImage(systemName: "xmark"), for: .normal)

        button.addTarget(
            self,
            action: #selector(didTapCloseButton),
            for: .touchUpInside)
        button.alpha = 0

        return button
    }()

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    // MARK: - Actions

    @objc private func didTapCloseButton() {
        startCloseLargeImageLayerAnimation()
    }

    // MARK: - Private

    private func configureView() {
        view.backgroundColor = .white
    }

    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(layoutView)
        view.addSubview(closeButton)
        view.addSubview(profileImageView)
    }

    private func setDefaultImageViewConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        centerXImageView = profileImageView.leftAnchor.constraint(
            equalTo: safeAreaLayoutGuide.leftAnchor,
            constant: Constants.moduleSize
        )
        centerYImageView = profileImageView.topAnchor.constraint(
            equalTo: safeAreaLayoutGuide.topAnchor,
            constant: Constants.moduleSize
        )

        widthImageView = profileImageView.widthAnchor.constraint(
            equalToConstant: Constants.imageSize
        )
        heightImageView = profileImageView.heightAnchor.constraint(
            equalToConstant: Constants.imageSize
        )

        NSLayoutConstraint.activate([
            centerXImageView,
            centerYImageView,
            widthImageView,
            heightImageView
        ])
    }

    private func setLargeImageViewConstraints() {

        var imageViewWidth: CGFloat

        if view.frame.width > view.frame.height {
            imageViewWidth = view.frame.height
        } else {
            imageViewWidth = view.frame.width
        }

        centerXImageView = profileImageView.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
        )
        centerYImageView = profileImageView.centerYAnchor.constraint(
            equalTo: view.centerYAnchor
        )
        widthImageView = profileImageView.widthAnchor.constraint(
            equalToConstant: imageViewWidth
        )
        heightImageView = profileImageView.heightAnchor.constraint(
            equalToConstant: imageViewWidth
        )

        NSLayoutConstraint.activate([
            centerXImageView,
            centerYImageView,
            widthImageView,
            heightImageView
        ])
    }

    private func deactivateImageViewConstraints() {
        NSLayoutConstraint.deactivate([
            centerXImageView,
            centerYImageView,
            widthImageView,
            heightImageView
        ])
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

        NSLayoutConstraint.activate([
            layoutView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor
            ),
            layoutView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor
            ),
            layoutView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor
            ),
            layoutView.heightAnchor.constraint(
                equalToConstant: safeAreaLayoutGuide.layoutFrame.height
            )
        ])

        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -Constants.moduleSize
            ),
            closeButton.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Constants.moduleSize
            ),
            closeButton.heightAnchor.constraint(
                equalToConstant: Constants.closeButtonSize
            ),
            closeButton.widthAnchor.constraint(
                equalToConstant: Constants.closeButtonSize
            )
        ])

        for constraint in profileImageView.constraints {
            profileImageView.removeConstraint(constraint)
        }
        setDefaultImageViewConstraints()

    }

    private func configureTableView() {
        tableView.estimatedRowHeight = 10.0
        tableView.rowHeight = UITableView.automaticDimension

        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.postCell.rawValue
        )

        tableView.register(
            PhotosTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.photosCell.rawValue
        )

        tableView.register(
            PostTableViewHeader.self,
            forHeaderFooterViewReuseIdentifier: CellReuseID.headerCell.rawValue
        )

        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Animations

    private func startLargeImageLayerAnimation() {
        tableView.isUserInteractionEnabled = false

        profileImageView.layer.zPosition = 1
        profileImageView.alpha = 1

        deactivateImageViewConstraints()
        setLargeImageViewConstraints()

        let animator = UIViewPropertyAnimator(
            duration: stepOneAnimationDuration,
            curve: .easeIn
        ) {
            self.profileImageView.layer.cornerRadius = 0
            self.layoutView.alpha = 0.95
            self.view.layoutIfNeeded()
        }

        let closeButtonAnimation = UIViewPropertyAnimator(
            duration: stepTwoAnimationDuration,
            curve: .linear
        ){
            self.closeButton.alpha = 1
        }

        animator.startAnimation()
        closeButtonAnimation.startAnimation(afterDelay: stepOneAnimationDuration)
    }

    private func startCloseLargeImageLayerAnimation() {

        let closeButtonAnimation = UIViewPropertyAnimator(
            duration: stepTwoAnimationDuration,
            curve: .easeOut
        ){
            self.closeButton.alpha = 0
        }

        deactivateImageViewConstraints()
        setDefaultImageViewConstraints()

        let animator = UIViewPropertyAnimator(
            duration: stepOneAnimationDuration,
            curve: .easeOut
        ){
            self.profileImageView.layer.cornerRadius = Constants.imageSize / 2
            self.layoutView.alpha = 0
            self.profileImageView.alpha = 0
            self.view.layoutIfNeeded()
        }

        animator.addCompletion { finishedPosition in
            //self.profileImageView.alpha = 0
            self.tableView.isUserInteractionEnabled = true
        }

        closeButtonAnimation.startAnimation()
        animator.startAnimation(afterDelay: stepTwoAnimationDuration)
    }
}

// MARK: - Extension

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let photoCell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseID.photosCell.rawValue,
            for: indexPath
        ) as? PhotosTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }

        if indexPath.row == 0 {
            var photosInBlock = 4
            if photos.count < photosInBlock {
                photosInBlock = photos.count
            }
            photoCell.pushContent(photos.prefix(photosInBlock))

            return photoCell
        }

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseID.postCell.rawValue,
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }

        cell.update(data[indexPath.row - 1])

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: CellReuseID.headerCell.rawValue
        ) as? PostTableViewHeader else {
            fatalError("could not dequeueReusableHeaderCell")
        }
        view.delegateProfile = self

        return view
    }

}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        default:
            return
        }
    }
    
}

extension ProfileViewController: ProfileViewControllerDelegate {
    func showLargeImageLayer() {
        startLargeImageLayerAnimation()
    }
}
