//
//  ChatHeaderView.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/03.
//

import UIKit

import SnapKit
import Then

final class ChatHeaderView: UIView {
    
    static var elementKind: String { UICollectionView.elementKindSectionHeader }
    
    static var reuseIdentifier: String {
        return String(describing: ChatHeaderView.self)
      }

    let bannerImage = UIImageView().then {
        $0.image = Image.bannerImage
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(bannerImage)
    }
    
    private func setupConstraints() {
        bannerImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(71)
        }
    }
}

