//
//  SignInViewController.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/02.
//

import UIKit

import RxSwift
import RxCocoa

final class SignInViewController: BaseViewController {
    
    private let signInView = SignInView()
    private var viewModel: SignInViewModel
    private lazy var input = SignInViewModel.Input(
        didEmailTextChange: signInView.emailTextField.rx.text.orEmpty.asSignal(onErrorJustReturn: ""),
        didPasswordTextChange: signInView.passwordTextField.rx.text.orEmpty.asSignal(onErrorJustReturn: ""),
        didCheckingTextChange: signInView.checkingPasswordTextField.rx.text.orEmpty.asSignal(onErrorJustReturn: ""),
        didNewAccountButtonTapped: signInView.newAccountButton.rx.tap
            .map { [unowned self] in
                return self.signInView.emailTextField.text!
        }
        .asSignal(onErrorJustReturn: ""))
    
    private lazy var output = viewModel.transform(input: input)
    private let disposeBag = DisposeBag()
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = signInView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func bind() {
        output.showToastAction
            .emit(onNext: { [weak self] text in
                guard let self = self else { return }
                self.view.makeToast(text, duration: 1, position: .bottom)
        })
        .disposed(by: disposeBag)
        
        output.isValid
            .drive(signInView.newAccountButton.rx.isValid)
            .disposed(by: disposeBag)
    }
}
