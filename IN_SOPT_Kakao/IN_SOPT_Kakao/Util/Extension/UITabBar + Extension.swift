//
//  UITabBar + Extension.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/12.
//

import UIKit

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = nil
        UITabBar.appearance().backgroundImage = nil
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
