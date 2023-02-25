import UIKit

final class ProfileHeaderView: UIView {

    private lazy var moduleSize: CGFloat = {
        let size: CGFloat
        size = 16.0
        return size
    }()

    private lazy var imageSize: CGFloat = {
        let size: CGFloat
        size = moduleSize * 6.0
        return size
    }()

    private lazy var imageContent: UIImage! = {
        let image = UIImage(named: "ProfileImage")
        return image
    }()

    private lazy var userStatus: String = ""
    private lazy var userStatusPlaceholder: String = "Your status is..."

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = imageContent
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: bounds.height))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carlo Brooney"
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.textColor = .black
        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: bounds.height))
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Becаme a doctor"
        label.text = userStatusPlaceholder
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.textColor = .gray
        return label
    }()

    private lazy var statusButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set status", for: .normal)
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
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var statusTextEdit: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        textField.layer.cornerRadius = 12.0
        textField.keyboardType = .alphabet
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        return textField
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        makeUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeUI()
    }

    private func makeUI() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
        addSubview(statusTextEdit)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: moduleSize),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: moduleSize),
            imageView.heightAnchor.constraint(equalToConstant: imageSize),
            imageView.widthAnchor.constraint(equalToConstant: imageSize),

            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: moduleSize),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27.0),

            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34.0),
            statusLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -moduleSize - 2),

            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: moduleSize),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -moduleSize),
//            statusButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: moduleSize),
            statusButton.topAnchor.constraint(equalTo: statusTextEdit.bottomAnchor, constant: moduleSize),
            statusButton.heightAnchor.constraint(equalToConstant: 50.0),

            statusTextEdit.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusTextEdit.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -moduleSize),
            statusTextEdit.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: moduleSize / 2),
            statusTextEdit.heightAnchor.constraint(equalToConstant: 40.0)

        ])
    }

    @objc func buttonPressed() {
//        print(statusLabel.text!)
        if userStatus.isEmpty {
            statusLabel.text = userStatusPlaceholder
        } else {
            statusLabel.text = userStatus
        }
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        userStatus = textField.text ?? ""
    }
    
}
