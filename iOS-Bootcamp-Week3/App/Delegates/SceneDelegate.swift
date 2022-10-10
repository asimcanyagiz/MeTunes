//
//  SceneDelegate.swift
//  iOS-Bootcamp-Week3
//
//  Created by Asım can Yağız on 9.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        setupWindow(with: windowScene)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


    private func setupWindow(with windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        let viewController = MainViewController()
        viewController.tabBarItem = UITabBarItem(title: "Podcast", image: UIImage(systemName: "music.mic"), selectedImage: UIImage(systemName: "music.mic"))
        let navigationController = UINavigationController(rootViewController: viewController)
        let tabBarController = UITabBarController()
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
        
        let musicScreenVC = UINavigationController(rootViewController: MusicViewController())
        musicScreenVC.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "music.quarternote.3"), selectedImage: UIImage(systemName: "music.quarternote.3"))
        let movieScreenVC = UINavigationController(rootViewController: MovieViewController())
        movieScreenVC.tabBarItem = UITabBarItem(title: "Movie", image: UIImage(systemName: "popcorn"), selectedImage: UIImage(systemName: "popcorn"))
        let personalScreenVc = UINavigationController(rootViewController: PersonalViewController())
        personalScreenVc.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star"))
        tabBarController.viewControllers = [navigationController, musicScreenVC, movieScreenVC, personalScreenVc]
    }
}

