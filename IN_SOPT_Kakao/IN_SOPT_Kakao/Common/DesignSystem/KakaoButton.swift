//
//  KakaoButton.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/02.
//

import UIKit

enum ButtonMode: CaseIterable {
    case login
    case newAccount
    case findAccount
    case confirm
}

final class KakaoButton: UIButton {
    
    private var mode: ButtonMode

    init(frame: CGRect, mode: ButtonMode) {
        self.mode = mode
        super.init(frame: frame)
        setupMode(mode: mode)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupMode(mode: ButtonMode) {

        switch self.mode {
        case .login:
            self.setButton(text: "카카오계정 로그인", size: 15, color: .systemGray6)
        
        case .newAccount:
            self.setButton(text: "새로운 카카오계정 만들기", size: 15, color: .systemGray6)
    
        case .findAccount:
            self.setButton(text: "카카오 계정 또는 비밀번호 찾기", size: 12, color: .white)
            
        case .confirm:
            self.setButton(text: "확인", size: 10, color: .systemYellow)
        }
    }
    
    private func setButton(text: String, size: CGFloat, color: UIColor) {
        setTitle(text, for: .normal)
        titleLabel?.font = .systemFont(ofSize: size, weight: .medium)
        backgroundColor = color
        setTitleColor(.black, for: .normal)
    }
}
