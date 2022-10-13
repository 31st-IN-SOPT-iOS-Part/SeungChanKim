//
//  UserView.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/03.
//

import UIKit

import SnapKit
import Then

final class UserView: BaseView {
    
    lazy var backgroundView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var userLabel = UILabel().then {
        $0.text = "환영합니다"
    }
    
    lazy var confirmButton = KakaoButton(frame: CGRect(), mode: .confirm)

    override func setupView() {
        [backgroundView, userLabel, confirmButton].forEach { addSubview($0) }
    }
    
    override func setupConstraints() {
        backgroundView.snp.makeConstraints {
            $0.height.equalTo(0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaInsets)
        }
        
        userLabel.snp.makeConstraints {
            $0.top.equalTo(backgroundView.snp.top).inset(30)
            $0.centerX.equalToSuperview()
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(userLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
    }
}
