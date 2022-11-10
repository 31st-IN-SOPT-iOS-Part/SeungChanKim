//
//  Profile.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/02.
//

import UIKit

struct Profile: Hashable {
    let profileImage: UIImage?
    let name: String
    let message: String
    let time: Date
}

extension Profile {
    static func profileDummy() -> [Profile] {
        return [
            Profile(profileImage: Image.profileImage1, name: "안솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage2, name: "최솝트", message: "피곤해요", time: Date.now),
            Profile(profileImage: Image.profileImage3, name: "정솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage4, name: "안솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage5, name: "안솝트", message: "언제 볼건데??", time: Date.now.addingTimeInterval(-10000)),
            Profile(profileImage: Image.profileImage6, name: "안솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage7, name: "안솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage8, name: "안솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage9, name: "안솝트", message: "언제 볼건데??", time: Date.now)
        ]
    }
}

class Section: Hashable {
    var id = UUID()
    
    var bannerImage: UIImage?
    var profile: [Profile]
    
    init(bannerImage: UIImage?, profile: [Profile]) {
        self.bannerImage = bannerImage
        self.profile = profile
      }
    
    
     func hash(into hasher: inout Hasher) {
       hasher.combine(id)
     }
     
     static func == (lhs: Section, rhs: Section) -> Bool {
       lhs.id == rhs.id
     }
      
}

extension Section {
    static var allSections: [Section] = [
        Section(bannerImage: Image.bannerImage, profile: [
            Profile(profileImage: Image.profileImage1, name: "안솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage2, name: "최솝트", message: "피곤해요", time: Date.now),
            Profile(profileImage: Image.profileImage3, name: "정솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage4, name: "안솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage5, name: "안솝트", message: "언제 볼건데??", time: Date.now.addingTimeInterval(-10000)),
            Profile(profileImage: Image.profileImage6, name: "안솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage7, name: "안솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage8, name: "안솝트", message: "언제 볼건데??", time: Date.now),
            Profile(profileImage: Image.profileImage9, name: "안솝트", message: "언제 볼건데??", time: Date.now)])]
}
