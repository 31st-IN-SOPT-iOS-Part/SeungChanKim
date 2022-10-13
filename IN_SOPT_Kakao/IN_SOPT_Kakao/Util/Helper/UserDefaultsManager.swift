//
//  UserDefaultsManager.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/12.
//

import Foundation

enum UserDefaultKeys: String, CaseIterable {
    case email
}

@propertyWrapper
struct UserDefaultWrapper<T> {
    private let key: String
    private let defaultValue: T
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

struct UserDefaultsManager {
    @UserDefaultWrapper(key: UserDefaultKeys.email.rawValue, defaultValue: "")
    static var email: String
}

