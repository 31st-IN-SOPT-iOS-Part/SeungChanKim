//
//  FriendViewModel.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/13.
//

import RxSwift
import RxCocoa

final class FriendViewModel: ViewModelType {
    
    var disposeBag = DisposeBag()
    
    private weak var coordinator: FriendCoordinator?
    
    init(coordinator: FriendCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let pressBackground: Signal<Void>
    }
    
    struct Output {
        let didBackgroundTapped: Signal<Void>
    }
    
    private let didBackgroundTapped = PublishRelay<Void>()
    
    func transform(input: Input) -> Output {
    
        input.pressBackground
            .emit(onNext: { [weak self] in
                guard let self = self else { return }
                self.coordinator?.showDetailViewController()
                self.didBackgroundTapped.accept(())
            })
            .disposed(by: disposeBag)
        
        return Output(didBackgroundTapped: didBackgroundTapped.asSignal())
    }
}
