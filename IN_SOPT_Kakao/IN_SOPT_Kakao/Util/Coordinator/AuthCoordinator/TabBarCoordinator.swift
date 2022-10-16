//
//  TabBarCoordinator.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/12.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    
    weak var delegate: CoordinatorDelegate?
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorCase = .tabBar
    
    func start() {
        let pages: [TabBarItem] = TabBarItem.allCases
        let controllers: [UINavigationController] = pages.map({
            self.createTabNavigationController(of: $0)
        })
        self.configureTabBarController(with: controllers)
    }
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)
        self.tabBarController = TabBarController()
    }
    
    private func configureTabBarController(with tabViewControllers: [UIViewController]) {
        self.tabBarController.setViewControllers(tabViewControllers, animated: true)
        self.tabBarController.selectedIndex = TabBarItem.friend.pageOrderNumber
        self.changeAnimation()
        self.tabBarController.tabBar.backgroundColor = .white
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        sceneDelegate?.window?.rootViewController = UINavigationController(rootViewController: tabBarController)
    }
    
    private func createTabNavigationController(of page: TabBarItem) -> UINavigationController {
        let tabNavigationController = UINavigationController()
        tabNavigationController.setNavigationBarHidden(false, animated: false)
        tabNavigationController.tabBarItem = self.configureTabBarItem(of: page)
        connectTabCoordinator(of: page, to: tabNavigationController)
        navigationController.navigationBar.isHidden = true
        return tabNavigationController
    }
    
    private func connectTabCoordinator(of page: TabBarItem, to tabNavigationController: UINavigationController) {
        switch page {
        case .friend:
            let friendCoordinator = FriendCoordinator(tabNavigationController)
            self.childCoordinators.append(friendCoordinator)
            friendCoordinator.start()
        case .chat:
            print("chat")
        case .myView:
            print("myView")
        case .shop:
            print("shop")
        case .more:
            print("more")
        }
    }
    
    private func configureTabBarItem(of page: TabBarItem) -> UITabBarItem {
        return page.asTabBarItem()
        
    }
}
