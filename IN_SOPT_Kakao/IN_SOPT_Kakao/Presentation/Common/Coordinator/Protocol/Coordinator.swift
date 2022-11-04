//
//  Coordinator.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/05.
//

import UIKit

protocol Coordinator: AnyObject {

    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorCase { get }
    func start()
    func finish()

    init(_ navigationController: UINavigationController)
}

extension Coordinator {

    func finish() {
        childCoordinators.removeAll()
        finishDelegate?
            .didFinish(childCoordinator: self)
    }

    func changeAnimation() {
        if let window = UIApplication.shared.windows.first {
            UIView.transition(with: window,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: nil)
        }
    }
}
