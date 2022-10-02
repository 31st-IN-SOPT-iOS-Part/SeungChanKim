//
//  UITextField + Extension.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/03.
//

import UIKit

extension UITextField {
    
    func addLeftPadding() {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
