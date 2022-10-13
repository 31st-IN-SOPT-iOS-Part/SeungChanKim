//
//  SignUpViewModel.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/05.
//

import RxSwift
import RxCocoa

final class SignUpViewModel: ViewModelType {
    
    var disposeBag = DisposeBag()
    
    private weak var coordinator: SignUpCoordinator?
    
    struct Input {
        let didEmailTextChange: Signal<String>
        let didPasswordTextChange: Signal<String>
        let didUserButtonTapped: Signal<String>
        let didNewAccountButtonTapped: Signal<String>
    }
    
    struct Output {
        let isValid: Driver<Bool>
        let showToastAction: Signal<String>
    }
    
    private let isValidEmail = BehaviorRelay<Bool>(value: false)
    private let isValidPassword = BehaviorRelay<Bool>(value: false)
    private let showToastAction = PublishRelay<String>()
    
    init(coordinator: SignUpCoordinator?) {
        self.coordinator = coordinator
    }
    
    func transform(input: Input) -> Output {
        
        input.didEmailTextChange
            .map { $0.isValidEmail() || $0.isValidPhoneNumber() }
            .emit(onNext: { [weak self] isValidState in
                guard let self = self else { return }
                self.isValidEmail.accept(isValidState)
            })
            .disposed(by: disposeBag)
        
        input.didPasswordTextChange
            .map { $0.isValidPassword() }
            .emit(onNext: { [weak self] isValidState in
                guard let self = self else { return }
                self.isValidPassword.accept(isValidState)
            })
            .disposed(by: disposeBag)
        
        input.didUserButtonTapped
            .emit(onNext: { [weak self] text in
                guard let self = self else { return }
                if self.isValidEmail.value && self.isValidPassword.value {
                    self.saveEmail(email: text)
                    self.coordinator?.showUserViewController()
                } else {
                    self.showToastAction.accept("다시 입력 ㄱㄱ")
                }
            })
            .disposed(by: disposeBag)
        
        input.didNewAccountButtonTapped
            .emit(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.coordinator?.showSignInViewController()
            })
            .disposed(by: disposeBag)
        
        return Output(isValid: isValidEmail.asDriver(),
                      showToastAction: showToastAction.asSignal())
    }
}

extension SignUpViewModel {
    private func saveEmail(email: String) {
        UserDefaultsManager.email = email
    }
}
