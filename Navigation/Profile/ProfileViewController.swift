import UIKit

final class ProfileViewController: UIViewController {

    private lazy var profileView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.safeAreaLayoutGuide.layoutFrame.size.width,
            height: view.safeAreaLayoutGuide.layoutFrame.size.height
        ))
        return view
    }()

    private lazy var headerView: UIView = {
        let view = UIView(frame: CGRect(
            x: 0,
            y: 120,
            width: view.safeAreaLayoutGuide.layoutFrame.size.width,
            height: view.safeAreaLayoutGuide.layoutFrame.size.height - 120
        ))
        view.backgroundColor = .systemGray4
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white

        view.addSubview(headerView)
        headerView.addSubview(profileView)

//        print(Float(tabBarController?.tabBar.frame.size.width ?? 0))
//        print(Float(tabBarController?.tabBar.frame.size.height ?? 0))
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        headerView.frame = CGRect(
            x: 0,
            y: 64,
            width: view.safeAreaLayoutGuide.layoutFrame.size.width,
            height: view.safeAreaLayoutGuide.layoutFrame.size.height
        )
    }

}
