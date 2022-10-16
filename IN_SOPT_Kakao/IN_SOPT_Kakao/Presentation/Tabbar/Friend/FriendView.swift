//
//  FriendView.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/13.
//

import UIKit

import SnapKit
import Then

final class FriendView: BaseView {
    
    private lazy var navigationBar = NavigationBar(frame: CGRect(), mode: .friend)
    
    private lazy var profileImageView = UIImageView().then {
        $0.image = Image.profileImage
    }
    
    private lazy var userNameLabel = UILabel().then {
        $0.text = "\(UserDefaultsManager.email)"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    lazy var backgroundButton = UIButton()
    
    override func setupView() {
        [navigationBar, backgroundButton]
            .forEach { addSubview($0) }
        
        [profileImageView, userNameLabel].forEach {
            backgroundButton.addSubview($0)
        }
    }
    
    override func setupConstraints() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        backgroundButton.snp.makeConstraints{
            $0.height.equalTo(100)
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }

        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(58)
            $0.top.equalTo(navigationBar.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(14)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
    }
}
