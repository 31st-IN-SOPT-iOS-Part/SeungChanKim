//
//  DefaultTabBarCoordinator.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/12.
//

import UIKit

final class DefaultTabBarCoordinator: TabBarCoordinator {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorCase = .tabBar
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)
        self.tabBarController = TabBarController()
    }
    
    func start() {
        let pages: [TabBarItem] = TabBarItem.allCases
        let controllers: [UINavigationController] = pages.map({
            self.createTabNavigationController(of: $0)
        })
        self.configureTabBarController(with: controllers)
    }
    
 
    private func configureTabBarController(with tabViewControllers: [UIViewController]) {
        self.tabBarController.setViewControllers(tabViewControllers, animated: true)
        self.tabBarController.selectedIndex = TabBarItem.friend.pageOrderNumber()
        self.tabBarController.tabBar.backgroundColor = .white
        /** SceneDelegate에서 DefaultAppCoordinator의 start()가 호출되는데 아래 코드가 없으면 동작이 안됨 **/
        self.navigationController.pushViewController(self.tabBarController, animated: true)
    }
    
    func selectPage(_ page: TabBarItem) {
        self.tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarItem(index: index) else { return }
        self.tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func currentPage() -> TabBarItem? {
        TabBarItem(index: self.tabBarController.selectedIndex)
    }
    
    private func createTabNavigationController(of page: TabBarItem) -> UINavigationController {
        let tabNavigationController = UINavigationController()
        
        tabNavigationController.setNavigationBarHidden(false, animated: false)
        tabNavigationController.tabBarItem = self.configureTabBarItem(of: page)
        connectTabCoordinator(of: page, to: tabNavigationController)
        return tabNavigationController
    }
    
    private func connectTabCoordinator(of page: TabBarItem, to tabNavigationController: UINavigationController) {
        switch page {
        case .friend:
            let friendCoordinator = FriendCoordinator(tabNavigationController)
            self.childCoordinators.append(friendCoordinator)
            friendCoordinator.start()
        case .chat:
            let chatCoordinator = DefaultChatCoordinator(tabNavigationController)
            self.childCoordinators.append(chatCoordinator)
            chatCoordinator.start()
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
