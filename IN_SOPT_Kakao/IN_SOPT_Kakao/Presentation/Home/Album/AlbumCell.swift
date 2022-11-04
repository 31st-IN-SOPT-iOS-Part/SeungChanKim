//
//  AlbumCell.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/01.
//

import UIKit

import SnapKit
import Then

final class AlbumCell: UICollectionViewCell {
    
    var index: Int = 0 {
        didSet {
            index != 0 ? cellState(.yellow, 3, false) : cellState(.black, 0, true)
        }
    }
    
    let imageView = UIImageView()
    
    private lazy var nameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.backgroundColor = .yellow
        $0.textColor = .black
        $0.textAlignment = .center
        $0.makeRoundedWithBorder(radius: 9)
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        
        [imageView, nameLabel]
            .forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.size.equalTo(18)
            $0.top.trailing.equalToSuperview().inset(4)
        }
    }
}

extension AlbumCell {

    func configure(album: Album, with index: Int) {
        
        self.index = index
        self.imageView.image = album.image
    }
    
    private func cellState(_ color: UIColor, _ width: CGFloat, _ isHidden: Bool) {
        
        contentView.layer.borderColor = color.cgColor
        contentView.layer.borderWidth = width
        nameLabel.isHidden = isHidden
        nameLabel.text = "\(index)"
    }
}
