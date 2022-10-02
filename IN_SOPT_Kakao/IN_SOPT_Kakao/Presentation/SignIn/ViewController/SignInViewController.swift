//
//  SignInViewController.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/02.
//

import UIKit

final class SignInViewController: UIViewController {
    
    private let signInView = SignInView()

    override func loadView() {
        self.view = signInView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addTarget()
    }
    
    private func addTarget() {
        self.signInView.newAccountButton.addTarget(self,
                                              action: #selector(presentToUserView),
                                              for: .touchUpInside)
    }
    
    @objc
    private func presentToUserView() {
        guard let navigationController = self.navigationController else { return }
        
        let userView = UserViewController(navigation: navigationController)
        userView.modalTransitionStyle = .crossDissolve
        userView.modalPresentationStyle = .overCurrentContext
        
        self.present(userView, animated: false) {
            userView.showSheetWithAnimation()
        }
    }
}
