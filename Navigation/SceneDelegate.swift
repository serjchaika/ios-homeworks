import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()

        let feedTabBarController = UINavigationController(rootViewController: FeedViewController())
        let profileTabBarController = UINavigationController(rootViewController: ProfileViewController())

        let appViewControllers = [feedTabBarController, profileTabBarController]

        appViewControllers.forEach({ $0.navigationBar.prefersLargeTitles = true })

        tabBarController.viewControllers = appViewControllers

        feedTabBarController.tabBarItem = UITabBarItem(
            title: "Feed",
            image: UIImage(systemName: "square.text.square"),
            tag: 0
        )
        profileTabBarController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.crop.square"),
            tag: 1
        )

        tabBarController.selectedIndex = 0

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window

    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}
