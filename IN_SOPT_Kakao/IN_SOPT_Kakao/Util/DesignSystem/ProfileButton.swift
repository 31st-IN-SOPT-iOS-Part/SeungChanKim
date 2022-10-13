//
//  ProfileButton.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/13.
//

import UIKit

enum ProfileMode: CaseIterable {
    case chat
    case edit
    case story
}

final class ProfileButton: UIButton {
    
    private var mode: ProfileMode

    init(frame: CGRect, mode: ProfileMode) {
        self.mode = mode
        super.init(frame: frame)
        setupMode(mode: mode)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupMode(mode: ProfileMode) {

        switch self.mode {
        case .chat:
            self.setButton(title: "나와의 채팅")
            setImage(Image.profileTalkImage, for: .normal)
        case .edit:
            self.setButton(title: "프로필 편집")
            setImage(Image.profileEditImage, for: .normal)
        case .story:
            self.setButton(title: "카카오스토리")
            setImage(Image.profileStoryImage, for: .normal)
        }
    }
    
    private func setButton(title: String) {
        var config = UIButton.Configuration.plain()
        var titleAttr = AttributedString.init(title)
            titleAttr.font = .systemFont(ofSize: 14, weight: .heavy)
        config.attributedTitle = titleAttr
        config.imagePadding = 10
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.imagePlacement = NSDirectionalRectEdge.top
        
        configuration = config
    }
}

