//
//  SceneDelegate.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/02.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigationController = UINavigationController()
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        self.appCoordinator = DefaultAppCoordinator(navigationController)
        self.appCoordinator?.start()
    }
}
