//
//  ChatViewModel.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/02.
//

import RxSwift
import RxCocoa

final class ChatViewModel: ViewModelType {
    
    var disposeBag = DisposeBag()
    
    private weak var coordinator: ChatCoordinator?
    
    private var profileData = Section.allSections
    
    init(coordinator: ChatCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let viewDidLoad: Signal<Void>
        let pressPlusButton: Signal<Void>
    }
    
    struct Output {
        let didLoadProfile: Driver<[Section]>
        let didPlusButtonTapped: Signal<Void>
    }
    
    private let didPlusButtonTapped = PublishRelay<Void>()
    private lazy var didLoadProfile = BehaviorRelay(value: profileData)
    
    func transform(input: Input) -> Output {
        
        input.viewDidLoad
            .withUnretained(self)
            .emit(onNext: { _ in
                self.didLoadProfile.accept(self.profileData)
            })
            .disposed(by: disposeBag)
        
        input.pressPlusButton
            .withUnretained(self)
            .emit(onNext: { _ in
                self.coordinator?.showAlbumViewController()
                self.didPlusButtonTapped.accept(())
            })
            .disposed(by: disposeBag)
        
        return Output(didLoadProfile: didLoadProfile.asDriver(),
                      didPlusButtonTapped: didPlusButtonTapped.asSignal())
    }
}
