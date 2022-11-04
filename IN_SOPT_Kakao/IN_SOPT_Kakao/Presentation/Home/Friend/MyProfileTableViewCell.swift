//
//  MyProfileTableViewCell.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/28.
//

import UIKit

import SnapKit
import Then

final class MyProfileTableViewCell: UITableViewCell {
    
    static let identifier = "MyProfileTableViewCell"
    
    private lazy var profileImageView = UIImageView().then {
        $0.image = Image.profileImage
    }

    private lazy var userNameLabel = UILabel().then {
        $0.text = "\(UserDefaultsManager.email)"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private lazy var underLine = UIView().then {
        $0.backgroundColor = .systemGray6
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
    
        [profileImageView, userNameLabel, underLine]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
 
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(58)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(14)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        underLine.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
