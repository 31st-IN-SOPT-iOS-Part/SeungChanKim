//
//  FriendListTableViewCell.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/27.
//

import UIKit

import SnapKit
import Then

final class FriendProfileTableViewCell: UITableViewCell {
    
    static let identifier = "FriendListTableViewCell"
    
    private lazy var profileImageView = UIImageView().then {
        $0.image = Image.profileImage
    }
    
    private lazy var userNameLabel = UILabel().then {
        $0.text = "\(UserDefaultsManager.email)"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private lazy var messageLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .gray
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        
        [profileImageView, userNameLabel, messageLabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(44)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(14)
        }
        
        messageLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
            $0.bottom.equalTo(profileImageView.snp.bottom)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
            $0.top.equalTo(profileImageView.snp.top)
        }
    }
}

extension FriendProfileTableViewCell {
    
    func configure(profile: Profile) {
        
        self.profileImageView.image = profile.profileImage
        self.userNameLabel.text = profile.name
        self.messageLabel.text = profile.message
    }
}
