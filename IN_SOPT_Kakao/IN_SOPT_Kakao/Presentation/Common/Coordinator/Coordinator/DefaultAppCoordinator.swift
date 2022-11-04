//
//  DefaultAppCoordinator.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/01.
//

import UIKit

final class DefaultAppCoordinator: AppCoordinator {

    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorCase { .app }

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        if UserDefaultsManager.email.isEmpty {
            self.showLoginFlow()
        } else {
            self.showTabBarFlow()
        }
    }
    
    func showLoginFlow() {
        let loginCoordinator = DefaultLoginCoordinator(self.navigationController)
        loginCoordinator.finishDelegate = self
        loginCoordinator.start()
        childCoordinators.append(loginCoordinator)
    }
    
    func showTabBarFlow() {
        let tabBarCoordinator = DefaultTabBarCoordinator(self.navigationController)
        tabBarCoordinator.finishDelegate = self
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}

extension DefaultAppCoordinator: CoordinatorFinishDelegate {

    func didFinish(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter({ $0.type != childCoordinator.type })
        self.navigationController.viewControllers.removeAll()
        
        switch childCoordinator.type {
        case .login:
            self.showTabBarFlow()
        case .tabBar:
            self.showLoginFlow()
        default:
            break
        }
    }
}

