//
//  DetailViewModel.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/13.
//

import UIKit

import RxSwift
import RxCocoa

final class DetailViewModel: ViewModelType {
    
    var disposeBag = DisposeBag()
    private weak var coordinator: FriendCoordinator?
    
    init(coordinator: FriendCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let pressXButton: Signal<Void>
    }
    
    struct Output {
        let didXButtonTapped: Signal<Void>
    }
    
    private let didXButtonTapped =  PublishRelay<Void>()
    
    func transform(input: Input) -> Output {
    
        input.pressXButton
            .emit(onNext: { [weak self] in
                guard let self = self else { return }
                self.coordinator?.dismissDetailViewController()
                self.didXButtonTapped.accept(())
            })
            .disposed(by: disposeBag)
        
        return Output(didXButtonTapped: didXButtonTapped.asSignal())
    }
}
