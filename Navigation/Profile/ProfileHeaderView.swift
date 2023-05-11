import UIKit
import SnapKit


final class ProfileHeaderView: UIView {

    weak var delegateHeaderView: PostTableViewHeaderDelegate?

    private lazy var userStatus: String = ""

    // MARK: - Subviews

    private lazy var imageContent: UIImage! = {
        let image = UIImage(named: "ProfileImage")
        return image
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.clipsToBounds = true
        imageView.image = imageContent
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = Constants.imageSize / 2

        imageView.isUserInteractionEnabled = true
        let tapProfileImage = UITapGestureRecognizer(
            target: self, 
            action: #selector(didTapProfileImage)
        )

        imageView.addGestureRecognizer(tapProfileImage)

        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = Constants.userName
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.textColor = .black

        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = Constants.userStatusPlaceholder
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.textColor = .gray

        return label
    }()

    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle(Constants.buttonStatusTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        if #available(iOS 15.0, *) {
            button.configuration = .filled()
            button.configuration?.baseBackgroundColor = .systemBlue
        } else {  }
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = UIColor.black.cgColor

        button.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)

        return button
    }()

    private lazy var statusTextEdit: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        textField.keyboardType = .alphabet
        textField.autocorrectionType = .no

        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 12.0
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0, weight: .regular)

        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)

        return textField
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect){
        super.init(frame: frame)
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
        setConstraints()
    }

    // MARK: - Action

    @objc private func statusButtonPressed() {
        if userStatus.isEmpty {
            statusLabel.text = Constants.userStatusPlaceholder
        } else {
            statusLabel.text = userStatus
        }
        statusTextEdit.resignFirstResponder()
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        userStatus = textField.text ?? ""
    }

    @objc private func didTapProfileImage() {
        delegateHeaderView?.profileImagePressed()
    }

    // MARK: - Private

    private func addSubviews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
        addSubview(statusTextEdit)
    }

    private func setConstraints() {

        imageView.snp.makeConstraints { (make) -> Void in
            make.leading.top.equalTo(Constants.moduleSize)
            make.width.height.equalTo(Constants.imageSize)
        }

        nameLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(imageView.snp.trailing).offset(Constants.moduleSize)
            make.top.equalTo(27.0)
        }

        statusLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(nameLabel)
            make.bottom.equalTo(imageView).offset(-Constants.moduleSize - 2)
        }

        statusButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(Constants.moduleSize)
            make.trailing.equalTo(-Constants.moduleSize)
            make.top.equalTo(statusTextEdit.snp.bottom).offset(Constants.moduleSize)
            make.height.equalTo(50.0)
        }

        statusTextEdit.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(statusButton)
            make.top.equalTo(statusLabel.snp.bottom).offset(Constants.halfModuleSize)
            make.height.equalTo(40.0)
        }

    }
    
}
