//
//  UIButton + RxExtension.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/05.
//

import RxSwift
import RxCocoa

extension Reactive where Base: KakaoButton {
    
    func isValid() -> Binder<Bool> {
        return Binder(base) { button, isValid in
            if isValid {
                button.isValid = true
            } else {
                button.isValid = false
            }
        }
    }
}
