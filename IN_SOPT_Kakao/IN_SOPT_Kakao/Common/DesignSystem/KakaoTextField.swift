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

final class KakaoTextField: UIView {
    
    private lazy var textField = UITextField()
    
    private lazy var bottomView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private var mode: TextFieldMode
    
    init(frame: CGRect, mode: TextFieldMode) {
        
        self.mode = mode
        super.init(frame: frame)
        
        textField.addLeftPadding()
        setupMode(mode: mode)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        [textField, bottomView].forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        textField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }
        
        bottomView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(textField.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func setupMode(mode: TextFieldMode) {
        switch self.mode {
        case .email:
            textField.attributedPlaceholder = NSAttributedString(string: "이메일 또는 전화번호",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        case .password:
            textField.attributedPlaceholder = NSAttributedString(string: "비밀번호",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        case .checkingPassword:
            textField.attributedPlaceholder = NSAttributedString(string: "비밀번호 확인",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        }
    }
}
