//
//  UIView + Extension.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/02.
//

import Foundation

import UIKit

extension UIView {
    
    public func makeRoundedWithBorder(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.yellow.cgColor
    }
}
