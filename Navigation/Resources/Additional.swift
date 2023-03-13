import UIKit

struct Post {
    var title: String
}

struct Constants {
    static let moduleSize: CGFloat = 16.0
    static var imageSize: CGFloat = {
        let size: CGFloat
        size = moduleSize * 6.0
        return size
    }()
    static let userStatusPlaceholder: String = "Your status is..."
    static let profileTitle: String = "Profile"
    static let feedTitle: String = "Feed"
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 12,
        bottom: 10,
        right: 12
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
