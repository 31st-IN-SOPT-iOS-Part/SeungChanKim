//
//  Tabbar.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/12.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private var tabs: [UIViewController] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarAppearance()
        setTabBarItems()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.frame.size.height = UIScreen.main.bounds.height * 0.1
        tabBar.frame.origin.y = view.frame.height - UIScreen.main.bounds.height * 0.1
    }
}

// MARK: - Functions

extension TabBarController {
    private func setTabBarAppearance() {
        UITabBar.clearShadow()
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .black
   
        tabBar.layer.borderWidth = 1.0
        tabBar.layer.borderColor = UIColor.systemGray6.cgColor
    }
    
    private func setTabBarItems() {
        tabs = [
            UINavigationController(rootViewController: FriendViewController(viewModel: FriendViewModel(coordinator: FriendCoordinator.init(UINavigationController())))),
            UINavigationController(rootViewController: ChatViewController()),
            UINavigationController(rootViewController: MyViewViewController()),
            UINavigationController(rootViewController: ShopViewController()),
            UINavigationController(rootViewController: MoreViewController())
        ]
        
        TabBarItem.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.asTabBarItem()
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }
        
        setViewControllers(tabs, animated: true)
    }
}
