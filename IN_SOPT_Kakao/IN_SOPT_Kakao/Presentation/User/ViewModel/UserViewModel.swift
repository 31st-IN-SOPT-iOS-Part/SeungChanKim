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
    
    private weak var coordinator: SignUpCoordinator?
    
    init(coordinator: SignUpCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let pressConfirmButton: Signal<Void>
    }
    
    struct Output {
        let didConfirmButtonTapped: Signal<Void>
    }
    
    private let didConfirmButtonTapped =  PublishRelay<Void>()
    
    func transform(input: Input) -> Output {
    
        input.pressConfirmButton
            .emit(onNext: { [weak self] in
                
                guard let self = self else { return }
            
                self.coordinator?.popToRootViewController()
                self.didConfirmButtonTapped.accept(())
                
            })
            .disposed(by: disposeBag)
        
    
        return Output(didConfirmButtonTapped: didConfirmButtonTapped.asSignal())
    }
}
