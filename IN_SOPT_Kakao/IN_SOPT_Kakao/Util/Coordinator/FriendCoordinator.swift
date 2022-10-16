//
//  FriendCoordinator.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/12.
//

import UIKit

final class FriendCoordinator: Coordinator {
    weak var delegate: CoordinatorDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorCase = .friend
    
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        let friendViewController = FriendViewController(viewModel:
                                                            FriendViewModel(coordinator: self))
       
        navigationController.pushViewController(friendViewController, animated: true)
    }
    
    func showDetailViewController() {
        let viewController = DetailViewController(viewModel: DetailViewModel(coordinator: self))
        viewController.modalPresentationStyle = .overFullScreen
        
        navigationController.present(viewController, animated: true)
    }
    
    func dismissDetailViewController() {
        navigationController.dismiss(animated: true)
    }
}
