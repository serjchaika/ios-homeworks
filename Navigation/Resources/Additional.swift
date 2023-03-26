import UIKit

struct Constants {
    static let moduleSize: CGFloat = 16.0
    static let halfModuleSize: CGFloat = 8.0
    static let innerPaddings: CGFloat = 12.0
    static var imageSize: CGFloat = {
        let size: CGFloat
        size = moduleSize * 6.0
        return size
    }()
    static let normalFontSize: CGFloat = 16.0
    static let smallFontSize: CGFloat = 14.0
    static let titleFontSize: CGFloat = 20.0
    static let bigTitleFontSize: CGFloat = 24.0

    static let borderWidth: CGFloat = 0.5
    static let loginStackSize: CGFloat = 100.0

    static let loginBorderColor: CGColor = UIColor.lightGray.cgColor

    static let userStatusPlaceholder: String = "Your status is..."
    static let loginPlaceholder: String = "Email or phone"
    static let passwordPlaceholder: String = "Password"

    static let profileTitle: String = "Profile"
    static let feedTitle: String = "Feed"
    static let photosSectionTitle: String = "Photos"
    static let photoGalleryTitle: String = "Photo Gallery"
    static let userName: String = "Carlo Brooney"

    static let buttonStatusTitle: String = "Set status"
    static let buttonLoginTitle: String = "Log in"
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

extension UITextField {
    func addBottomBorder(at y: CGFloat){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: y, width: 2000, height: Constants.borderWidth)
        bottomLine.backgroundColor = Constants.loginBorderColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}

extension UIImage {
    func withAlpha(_ a: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { (_) in
            draw(in: CGRect(origin: .zero, size: size), blendMode: .normal, alpha: a)
        }
    }
}
