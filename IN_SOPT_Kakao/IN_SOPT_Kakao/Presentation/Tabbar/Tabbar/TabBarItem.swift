//
//  TabBarItem.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/12.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case friend
    case chat
    case myView
    case shop
    case more
}

extension TabBarItem {
    init?(index: Int) {
        switch index {
        case 0: self = .friend
        case 1: self = .chat
        case 2: self = .myView
        case 3: self = .shop
        case 4: self = .more
        default: return nil
        }
    }
    
    var pageOrderNumber: Int {
        switch self {
        case .friend: return 0
        case .chat: return 1
        case .myView: return 2
        case .shop: return 3
        case .more: return 4
        }
    }
    
    var inactiveIcon: UIImage? {
        switch self {
        case .friend:   return Image.personImage
        case .chat:     return Image.messageImage
        case .myView:   return Image.eyeImage
        case .shop:     return Image.bagImage
        case .more:     return Image.moreImage
        }
    }
    
    var activeIcon: UIImage? {
        switch self {
        case .friend:   return Image.personFillImage
        case .chat:     return Image.messageFillImage
        case .myView:   return Image.eyeFillImage
        case .shop:     return Image.bagFillImage
        case .more:     return Image.moreFillImage
        }
    }
}

extension TabBarItem {
    public func asTabBarItem() -> UITabBarItem {
        return UITabBarItem(
            title: nil,
            image: inactiveIcon,
            selectedImage: activeIcon
        )
    }
}
