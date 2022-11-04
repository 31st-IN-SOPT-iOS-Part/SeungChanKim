//
//  ChatView.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/01.
//

import UIKit

import SnapKit
import Then

final class ChatView: BaseView {
    
    lazy var navigationBar = NavigationBar(frame: CGRect(), mode: .chat)
    

    lazy var collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: self.createLayout())
    
    private lazy var chatHeaderView = ChatHeaderView()
    
    override func setupView() {

        [navigationBar, chatHeaderView, collectionView]
            .forEach { addSubview($0) }

    }
    
    override func setupConstraints() {
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        chatHeaderView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(71)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(chatHeaderView.snp.bottom).offset(5)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
}

extension ChatView {
    
    private func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.14))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.15))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let headerFooterSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .estimated(80
                                     )
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: headerFooterSize,
          elementKind: UICollectionView.elementKindSectionHeader,
          alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        return layout
    }
}

