//
//  AlbumView.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/01.
//

import UIKit

import SnapKit
import Then

final class AlbumView: BaseView {
    
    lazy var xButton = UIButton().then {
        $0.setImage(Image.closeImage, for: .normal)
        $0.tintColor = .black
    }
    lazy var navigationTitle = UILabel().then {
        $0.text = "최근 항목"
    }
    
    lazy var sendButton = UIButton().then {
        $0.setTitle("전송", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    lazy var collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: createLayout())
    
    override func setupView() {
        
        [xButton, navigationTitle, sendButton, collectionView]
            .forEach { addSubview($0) }
    }
    
    override func setupConstraints() {
        
        xButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.top.equalTo(safeAreaInsets).inset(50)
            $0.leading.equalToSuperview().inset(10)
        }
        
        navigationTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(xButton)
        }
        
        sendButton.snp.makeConstraints {
            $0.width.equalTo(33)
            $0.height.equalTo(16)
            $0.centerY.equalTo(xButton)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(xButton.snp.bottom).inset(-10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension AlbumView {
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
