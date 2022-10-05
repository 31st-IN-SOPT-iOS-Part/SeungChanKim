//
//  SignUpViewController.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/02.
//

import UIKit

import RxSwift
import RxCocoa
import Toast

final class SignUpViewController: BaseViewController {
    
    private let signUpView = SignUpView()
    
    private lazy var input = SignUpViewModel.Input(
        didEmailTextChange: signUpView.emailTextField.rx.text.orEmpty.asSignal(onErrorJustReturn: ""),
        didPasswordTextChange: signUpView.passwordTextField.rx.text.orEmpty.asSignal(onErrorJustReturn: ""),
        didUserButtonTapped: signUpView.loginButton.rx.tap.withLatestFrom(signUpView.emailTextField.rx.text.orEmpty)
            .asSignal(onErrorJustReturn: ""),
        didNewAccountButtonTapped: signUpView.newAccountButton.rx.tap.asSignal())
    
    private lazy var output = viewModel.transform(input: input)
    
    private let disposeBag = DisposeBag()
    
    private var viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("SignUpViewController Error!")
    }
    
    override func loadView() {
        self.view = signUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
    }

    override func bind() {
        output.showToastAction
            .emit(onNext: { [weak self] text in
                guard let self = self else { return }
                self.view.makeToast(text, duration: 1, position: .bottom)
        })
        .disposed(by: disposeBag)
        
        output.isValid
            .drive(signUpView.loginButton.rx.isValid)
            .disposed(by: disposeBag)
    }
}
