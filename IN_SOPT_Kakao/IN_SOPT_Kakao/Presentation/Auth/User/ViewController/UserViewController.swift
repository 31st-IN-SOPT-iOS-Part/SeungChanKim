//
//  UserViewController.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/03.
//

import UIKit

import SnapKit
import RxCocoa
import RxSwift

final class UserViewController: BaseViewController {
    
    private let userView = UserView()
    var navigation: UINavigationController
    private lazy var input = UserViewModel.Input(pressConfirmButton: userView.confirmButton.rx.tap.asSignal())
    private lazy var output = viewModel.transform(input: input)
    private let disposeBag = DisposeBag()
    private let sheetHeight = UIScreen.main.bounds.height * 0.4
    
    private var viewModel: UserViewModel
    
    override func loadView() {
        self.view = userView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init(navigation: UINavigationController, viewModel: UserViewModel) {
        self.viewModel = viewModel
        self.navigation = navigation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("UserViewController Error!")
    }

    override func style() {
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
    }
    
    override func bind() {

        output.userEmailText
            .map { $0 + " 환영합니다."}
            .drive(userView.userLabel.rx.text)
            .disposed(by: disposeBag)
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
