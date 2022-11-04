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
  
    lazy var profileTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(MyProfileTableViewCell.self,
                    forCellReuseIdentifier: MyProfileTableViewCell.identifier)
        $0.register(FriendProfileTableViewCell.self,
                    forCellReuseIdentifier: FriendProfileTableViewCell.identifier)
    }

    override func setupView() {
        [navigationBar, profileTableView]
            .forEach { addSubview($0) }

    }
    
    override func setupConstraints() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        profileTableView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
