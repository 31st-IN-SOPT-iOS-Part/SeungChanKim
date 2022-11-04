//
//  Album.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/02.
//

import UIKit

struct Album: Hashable {
    let image: UIImage
    var index = 0
    
    init(image: UIImage) {
        self.image = image
    }
}

extension Album {
    static func dummy() -> [Album] {
        return [
            Album(image: Image.cameraImage),
            Album(image: Image.galleryImage3),
            Album(image: Image.galleryImage4),
            Album(image: Image.galleryImage5),
            Album(image: Image.galleryImage6),
            Album(image: Image.galleryImage7),
            Album(image: Image.galleryImage8),
            Album(image: Image.galleryImage9),
            Album(image: Image.galleryImage10),
            Album(image: Image.galleryImage11),
            Album(image: Image.galleryImage12),
            Album(image: Image.galleryImage13),
            Album(image: Image.galleryImage14),
            Album(image: Image.galleryImage15),
            Album(image: Image.galleryImage16),
            Album(image: Image.galleryImage17),
            Album(image: Image.galleryImage18),
            Album(image: Image.galleryImage19),
            Album(image: Image.galleryImage20)
        ]
    }
}
