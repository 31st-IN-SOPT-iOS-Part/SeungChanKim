//
//  LoginCoordinator.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/01.
//

import Foundation

protocol LoginCoordinator: Coordinator {
    
    func showSignUpViewController()
    func showUserViewController()
    func showSignInViewController()
    func popToRootViewController()
    func connectTabBarCoordinator()
}
