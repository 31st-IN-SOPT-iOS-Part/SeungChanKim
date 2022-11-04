//
//  ChatCell.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/02.
//

import UIKit

import SnapKit
import Then

final class ChatCell: UICollectionViewCell {
    
    let profileImageView = UIImageView()
    
    private lazy var nameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private lazy var messageLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .gray
    }
    
    private lazy var timeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        $0.textColor = .gray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        
        [profileImageView, nameLabel, messageLabel, timeLabel]
            .forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        
        profileImageView.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(11)
        }
        
        messageLabel.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.bottom).inset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(11)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

extension ChatCell {
    
    func configure(profile: Profile) {

        self.profileImageView.image = profile.profileImage
        self.timeLabel.text = "\(profile.time.toString(of: .time))"
        self.nameLabel.text = profile.name
        self.messageLabel.text = profile.message
    }
}
