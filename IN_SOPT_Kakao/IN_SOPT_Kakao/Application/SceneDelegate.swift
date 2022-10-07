//
//  SceneDelegate.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/02.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var signUpCoordinator: SignUpCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        
        signUpCoordinator = SignUpCoordinator(navigationController)
        signUpCoordinator?.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
}
