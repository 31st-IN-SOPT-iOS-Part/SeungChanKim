//
//  NavigationBar.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/13.
//

import UIKit

import SnapKit
import Then

final class NavigationBar: BaseView {
    
    // MARK: - Properties
    private var mode: TabBarItem
 
    private lazy var navigationTitle = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
    }
    
    private lazy var searchButton = UIButton().then {
        $0.setImage(Image.searchImage, for: .normal)
        $0.tintColor = .black
    }
    
    private lazy var addFriendButton = UIButton().then {
        $0.setImage(Image.addFriendImage, for: .normal)
        $0.tintColor = .black
    }
    
    private lazy var musicButton = UIButton().then {
        $0.setImage(Image.musicImage, for: .normal)
        $0.tintColor = .black
    }
    
    private lazy var settingButton = UIButton().then {
        $0.setImage(Image.settingImage, for: .normal)
    }
    
    lazy var plusButton = UIButton().then {
        $0.setImage(Image.plusImage, for: .normal)
    }
    
    private lazy var horizontalStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 0
    }
    
    // MARK: - Initialization
    init(frame: CGRect, mode: TabBarItem) {
        self.mode = mode
        
        super.init(frame: frame)
        
        setupMode(mode: mode)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setupView() {

        [navigationTitle, horizontalStackView].forEach { addSubview($0) }
        
        [searchButton, addFriendButton, musicButton, plusButton, settingButton]
            .forEach { horizontalStackView.addArrangedSubview($0) }
    }
    
    override func setupConstraints() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(55)
        }
        navigationTitle.snp.makeConstraints {
            $0.centerX.equalTo(safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(14)
        }
        
        horizontalStackView.arrangedSubviews.forEach {
            $0.snp.makeConstraints {
                $0.width.height.equalTo(30)
            }
        }

        horizontalStackView.snp.makeConstraints {
            $0.centerY.equalTo(navigationTitle.snp.centerY)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func setupMode(mode: TabBarItem) {
        self.mode = mode
        switch self.mode {
        case .friend:
            self.navigationTitle.text = "친구"
        case .chat:
            self.navigationTitle.text = "채팅"
            [searchButton, addFriendButton, musicButton]
                .forEach { $0.isHidden = true }
        case .myView:
            self.navigationTitle.text = "뷰"
        case .shop:
            self.navigationTitle.text = "쇼핑"
        case .more:
            self.navigationTitle.text = "더보기"
        }
    }
}
