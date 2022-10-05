//
//  SignInView.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/02.
//

import UIKit

import SnapKit
import Then

final class SignInView: BaseView {
    
    private lazy var startKakaoLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = .systemFont(ofSize: 22, weight: .regular)
    }
    lazy var emailTextField = KakaoTextField(frame: CGRect(), mode: .email)
    lazy var passwordTextField = KakaoTextField(frame: CGRect(), mode: .password)
    lazy var checkingPasswordTextField = KakaoTextField(frame: CGRect(), mode: .checkingPassword)
    lazy var newAccountButton = KakaoButton(frame: CGRect(), mode: .newAccount)
    
    override func setupView() {
        
        [startKakaoLabel, emailTextField, checkingPasswordTextField,
         passwordTextField, newAccountButton].forEach { addSubview($0) }
    }
    
    override func setupConstraints() {
        
        startKakaoLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(13)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview().multipliedBy(0.8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).inset(5)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
        
        checkingPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).inset(5)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }

        newAccountButton.snp.makeConstraints {
            $0.top.equalTo(checkingPasswordTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
    }
}
