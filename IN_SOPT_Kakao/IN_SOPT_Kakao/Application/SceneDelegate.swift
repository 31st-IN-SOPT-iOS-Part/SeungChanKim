//
//  SceneDelegate.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/02.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: windowScene)
            window?.windowScene = windowScene
            window?.rootViewController = UINavigationController(rootViewController: SignUpViewController())
            window?.backgroundColor = .white

        
            window?.makeKeyAndVisible()
    }
}
