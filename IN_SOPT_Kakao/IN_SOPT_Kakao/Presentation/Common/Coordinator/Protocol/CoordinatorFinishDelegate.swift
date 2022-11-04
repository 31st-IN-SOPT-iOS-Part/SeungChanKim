//
//  CoordinatorFinishDelegate.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/05.
//

import Foundation

protocol CoordinatorFinishDelegate: AnyObject {

    func didFinish(childCoordinator: Coordinator)
}
