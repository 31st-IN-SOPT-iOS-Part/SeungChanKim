//
//  UserViewController.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/03.
//

import UIKit

import SnapKit

final class UserViewController: UIViewController {
    
    private let userView = UserView()
    
    var navigation: UINavigationController
    
    private let sheetHeight = UIScreen.main.bounds.height * 0.4
    
    override func loadView() {
        self.view = userView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        style()
        addTarget()
    }
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func style() {
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
    }
    
    private func addTarget() {
        userView.confirmButton.addTarget(self,
                                         action: #selector(popToRootView),
                                         for: .touchUpInside)
    }
}

extension UserViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
      
        if let touch = touches.first,
           touch.view == self.view {
            self.animatedView(height: 0)
            self.dismiss(animated: true)
        }
    }
    
    public func showSheetWithAnimation() {
        self.animatedView(height: sheetHeight)
    }
    
    @objc
    private func popToRootView() {
        self.animatedView(height: 0)
        self.dismiss(animated: true) {
            self.navigation.popToRootViewController(animated: true)
        }
    }
    
    func animatedView(height: CGFloat) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.userView.backgroundView.snp.remakeConstraints {
                $0.height.equalTo(height)
                $0.leading.trailing.equalToSuperview()
                $0.bottom.equalToSuperview()
            }
            self?.view.layoutIfNeeded()
        }
    }
}
