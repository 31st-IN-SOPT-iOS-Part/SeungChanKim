//
//  CoordinatorDelegate.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/05.
//

import Foundation

protocol CoordinatorDelegate: AnyObject {

    func didFinish(childCoordinator: Coordinator)
}
