//
//  FriendViewModel.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/13.
//

import RxSwift
import RxCocoa
import UIKit

final class FriendViewModel: ViewModelType {
    
    var disposeBag = DisposeBag()
    
    private weak var coordinator: FriendCoordinator?
    
    private var profileData = Profile.profileDummy()
    
    init(coordinator: FriendCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let pressBackground: Signal<Int>
        let viewDidLoad: Signal<Void>
    }
    
    struct Output {
        let didLoadProfile: Driver<[Profile]>
        let didBackgroundTapped: Signal<Profile>
    }
    
    private let didBackgroundTapped = PublishRelay<Profile>()
    
    private lazy var didLoadProfile = BehaviorRelay<[Profile]>(value: self.profileData)
    
    private let didPressProfile = PublishRelay<Profile>()
    
    func transform(input: Input) -> Output {
        
        input.viewDidLoad
            .withUnretained(self)
            .emit(onNext: { _ in
                self.didLoadProfile.accept(self.profileData)
            })
            .disposed(by: disposeBag)
        
        input.pressBackground
            .emit(onNext: { [weak self] row in
                guard let self = self else { return }
                self.coordinator?.showDetailViewController()
                self.didPressProfile.accept(self.didLoadProfile.value[row])
            })
            .disposed(by: disposeBag)
        
        return Output(didLoadProfile: didLoadProfile.asDriver(), didBackgroundTapped: didBackgroundTapped.asSignal()
        )
    }
}
