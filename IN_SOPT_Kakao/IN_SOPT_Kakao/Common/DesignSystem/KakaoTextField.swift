//
//  KakaoTextField.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/02.
//

import UIKit

import SnapKit
import Then

enum TextFieldMode: CaseIterable {
    case email
    case password
    case checkingPassword
}

// enum -> 세가지 케이스

final class KakaoTextField: UITextField {
    
    lazy var bottomView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private var mode: TextFieldMode
    
    init(frame: CGRect, mode: TextFieldMode) {
        
        self.mode = mode
        super.init(frame: frame)
        
        addLeftPadding()
        setupMode(mode: mode)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        [bottomView].forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(self.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    private func setupMode(mode: TextFieldMode) {
        switch self.mode {
        case .email:
            attributedPlaceholder = NSAttributedString(string: "이메일 또는 전화번호",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        case .password:
            attributedPlaceholder = NSAttributedString(string: "비밀번호",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            isSecureTextEntry = true
        case .checkingPassword:
            attributedPlaceholder = NSAttributedString(string: "비밀번호 확인",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            isSecureTextEntry = true
        }
    }
}
