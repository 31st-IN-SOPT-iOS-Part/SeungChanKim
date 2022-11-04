//
//  UserViewModel.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/05.
//

import RxSwift
import RxCocoa

final class UserViewModel: ViewModelType {
    
    var disposeBag = DisposeBag()
    
    private weak var coordinator: DefaultLoginCoordinator?
    
    init(coordinator: DefaultLoginCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let pressConfirmButton: Signal<Void>
    }
    
    struct Output {
        let didConfirmButtonTapped: Signal<Void>
        let userEmailText: Driver<String>
    }
    
    private let didConfirmButtonTapped =  PublishRelay<Void>()
    private let userEmailText = BehaviorRelay<String>(value: UserDefaultsManager.email)
    
    func transform(input: Input) -> Output {
    
        input.pressConfirmButton
            .emit(onNext: { [weak self] in
                guard let self = self else { return }
                self.coordinator?.connectTabBarCoordinator()
                self.didConfirmButtonTapped.accept(())
            })
            .disposed(by: disposeBag)
        
        return Output(didConfirmButtonTapped: didConfirmButtonTapped.asSignal(),
                      userEmailText: userEmailText.asDriver())
    }
}
