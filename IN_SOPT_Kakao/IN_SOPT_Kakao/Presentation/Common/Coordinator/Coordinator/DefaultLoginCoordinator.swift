//
//  DefaultLoginCoordinator.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/05.
//

import UIKit

final class DefaultLoginCoordinator: LoginCoordinator {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators =  [Coordinator]()
    var type: CoordinatorCase = .login
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSignUpViewController()
    }
    
    func showSignUpViewController() {
        let viewController = SignUpViewController(
            viewModel: SignUpViewModel(coordinator: self)
        )
        changeAnimation()
        navigationController.viewControllers = [viewController]
    }
    
    func showUserViewController() {
        let viewModel = UserViewModel(coordinator: self)
        
        let viewController = UserViewController(navigation: navigationController, viewModel: viewModel)
        
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .overCurrentContext
        
        navigationController.present(viewController, animated: false) {
            viewController.showSheetWithAnimation()
        }
    }
    
    func showSignInViewController() {
        let viewModel = SignInViewModel(coordinator: self)
        
        let viewController = SignInViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func popToRootViewController() {
        navigationController.dismiss(animated: true) {
            self.navigationController.popToRootViewController(animated: true)
        }
    }
    
    func connectTabBarCoordinator() {
        self.navigationController.dismiss(animated: true) {
            let tabBarCoordinator = DefaultTabBarCoordinator(self.navigationController)
            tabBarCoordinator.start()
            self.childCoordinators.append(tabBarCoordinator)
        }
    }
    
    func finish() {
        finishDelegate?
            .didFinish(childCoordinator: self)
    }
}
