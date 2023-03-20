import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()

        let feedTabBarController = UINavigationController(rootViewController: FeedViewController())
        let profileTabBarController = UINavigationController(rootViewController: LogInViewController())

        let appViewControllers = [feedTabBarController, profileTabBarController]

        //appViewControllers.forEach({ $0.navigationBar.prefersLargeTitles = true })
        feedTabBarController.navigationBar.prefersLargeTitles = true

        tabBarController.viewControllers = appViewControllers

        feedTabBarController.tabBarItem = UITabBarItem(
            title: Constants.feedTitle,
            image: UIImage(systemName: "square.text.square"),
            tag: 0
        )
        profileTabBarController.tabBarItem = UITabBarItem(
            title: Constants.profileTitle,
            image: UIImage(systemName: "person.crop.square"),
            tag: 1
        )
        tabBarController.tabBar.backgroundColor = .white        
        tabBarController.selectedIndex = 0

        window.rootViewController = tabBarController
        self.window = window

        window.makeKeyAndVisible()
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
