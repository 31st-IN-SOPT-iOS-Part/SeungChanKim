//
//  SignUpViewController.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/02.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    private let signUpView = SignUpView()
    
    override func loadView() {
        self.view = signUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBar()
        self.addTarget()
    }
    
    private func setNavigationBar() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
    }

    private func addTarget() {
        self.signUpView.newAccountButton.addTarget(self,
                                              action: #selector(pushToSignInView),
                                              for: .touchUpInside)
        
        self.signUpView.loginButton.addTarget(self,
                                              action: #selector(presentToUserView),
                                              for: .touchUpInside)
    }
    
    @objc
    private func pushToSignInView() {
        let signInView = SignInViewController()
        self.navigationController?.pushViewController(signInView, animated: true)
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
