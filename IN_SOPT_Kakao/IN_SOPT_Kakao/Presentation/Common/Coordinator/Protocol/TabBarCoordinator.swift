//
//  TabBarCoordinator.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/01.
//

import UIKit

protocol TabBarCoordinator: Coordinator {
    
    var tabBarController: UITabBarController { get set }
    func selectPage(_ page: TabBarItem)
    func setSelectedIndex(_ index: Int)
    func currentPage() -> TabBarItem?
}
