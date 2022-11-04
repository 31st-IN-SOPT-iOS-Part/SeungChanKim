//
//  DetailView.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/13.
//

import UIKit

import SnapKit
import Then

final class DetailView: BaseView {
    
    lazy var xButton = UIButton().then {
        $0.setImage(Image.closeImage, for: .normal)
    }
    
    private lazy var profileImageView = UIImageView().then {
        $0.image = Image.profileImage
    }
    
    private lazy var userNameLabel = UILabel().then {
        $0.text = "\(UserDefaultsManager.email)"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    private lazy var underLineView = UIView().then {
        $0.backgroundColor = .white
    }
    
    
    lazy var chatButton = ProfileButton(frame: CGRect(), mode: .chat)
    lazy var editProfileButton = ProfileButton(frame: CGRect(), mode: .edit)
    lazy var kakaoStoryButton = ProfileButton(frame: CGRect(), mode: .story)
    
    override func setupView() {
        [xButton, profileImageView, userNameLabel,
         underLineView, chatButton, editProfileButton,
         kakaoStoryButton].forEach { addSubview($0) }
    }
    
    override func setupConstraints() {
        xButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(40)
        }
        
        profileImageView.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.width.height.equalTo(80)
            $0.centerY.equalToSuperview().multipliedBy(1.4)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(profileImageView.snp.bottom).inset(-8)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).inset(-42)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        editProfileButton.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(underLineView.snp.bottom).inset(-8)
            $0.width.height.equalTo(100)
        }
        
        chatButton.snp.makeConstraints {
            $0.trailing.equalTo(editProfileButton.snp.leading).offset(-10)
            $0.top.equalTo(underLineView.snp.bottom).inset(-8)
            $0.width.height.equalTo(100)
        }
        
        kakaoStoryButton.snp.makeConstraints {
            $0.leading.equalTo(editProfileButton.snp.trailing).offset(10)
            $0.top.equalTo(underLineView.snp.bottom).inset(-8)
            $0.width.height.equalTo(100)
        }
    }
}
