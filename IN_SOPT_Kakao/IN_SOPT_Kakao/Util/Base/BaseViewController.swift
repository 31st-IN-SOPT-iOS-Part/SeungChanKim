//
//  BaseViewController.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/05.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        bind()
    }
    
    func style() {
        view.backgroundColor = .white
    }
    
    func bind() {}
}
