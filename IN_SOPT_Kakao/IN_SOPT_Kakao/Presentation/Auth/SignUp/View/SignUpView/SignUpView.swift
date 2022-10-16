//
//  SignUpView.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/02.
//

import UIKit

import SnapKit
import Then

final class SignUpView: BaseView {
    
    private lazy var startKakaoLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = .systemFont(ofSize: 22, weight: .regular)
    }
    
    private lazy var kakaoInfoLabel = UILabel().then {
        $0.text = "사용하던 카카오톡 계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요."
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    lazy var emailTextField = KakaoTextField(frame: CGRect(), mode: .email)
    lazy var passwordTextField = KakaoTextField(frame: CGRect(), mode: .password)
    lazy var loginButton = KakaoButton(frame: CGRect(), mode: .login)
    lazy var newAccountButton = KakaoButton(frame: CGRect(), mode: .newAccount)
    lazy var findAccountButton = KakaoButton(frame: CGRect(), mode: .findAccount)
    
    override func setupView() {
        
        [startKakaoLabel, kakaoInfoLabel, emailTextField,
         passwordTextField, loginButton, newAccountButton,
         findAccountButton].forEach { addSubview($0) }
    }
    
    override func setupConstraints() {
        
        startKakaoLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(13)
            $0.centerX.equalToSuperview()
        }
        
        kakaoInfoLabel.snp.makeConstraints {
            $0.top.equalTo(startKakaoLabel.snp.bottom).offset(20)
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

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
        
        newAccountButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }

        findAccountButton.snp.makeConstraints {
            $0.top.equalTo(newAccountButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
    }
}
