//
//  ChatCoordinator.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/24.
//

import UIKit

final class DefaultChatCoordinator: ChatCoordinator {
 
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorCase = .chat
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        let viewModel = ChatViewModel(coordinator: self)
        let chatViewController = ChatViewController(viewModel: viewModel)
        navigationController.pushViewController(chatViewController, animated: true)
    }
    
    func showAlbumViewController() {
        let viewModel = AlbumViewModel(coordinator: self)
        let albumViewController = AlbumViewController(viewModel: viewModel)
        albumViewController.modalPresentationStyle = .currentContext
        albumViewController.modalTransitionStyle = .crossDissolve
        navigationController.tabBarController?.tabBar.isHidden = true
        navigationController.present(albumViewController, animated: true)
    }
    
    func dismissAlbumViewController() {
        navigationController.tabBarController?.tabBar.isHidden = false
        navigationController.dismiss(animated: true)
    }
}
