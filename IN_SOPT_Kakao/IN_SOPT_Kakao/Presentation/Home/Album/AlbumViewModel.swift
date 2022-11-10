//
//  AlbumViewModel.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/02.
//

import Foundation

import RxSwift
import RxCocoa

final class AlbumViewModel: ViewModelType {
    
    var disposeBag = DisposeBag()
    var selectedPhotos: [Int] = []
    private var photoData = Album.dummy()
    
    private weak var coordinator: ChatCoordinator?
    
    init(coordinator: ChatCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let viewDidLoad: Signal<Void>
        let pressPhotoItem: Signal<Int>
        let pressXButton: Signal<Void>
    }
    
    struct Output {
        let didLoadAlbum: Driver<[Album]>
        let didPressPhotoItem: Signal<Album>
        let didXButtonTapped: Signal<Void>
    }
    
    private lazy var didLoadAlbum = BehaviorRelay(value: photoData)
    private let didPressPhotoItem = PublishRelay<Album>()
    private let didXButtonTapped = PublishRelay<Void>()
    
    func transform(input: Input) -> Output {
        
        input.viewDidLoad
            .emit()
            .disposed(by: disposeBag)
        
        input.pressPhotoItem
            .withUnretained(self)
            .emit { item, row in
                item.photoDidTap(index: row)
            }
            .disposed(by: disposeBag)
        
        input.pressXButton
            .withUnretained(self)
            .emit(onNext: { _ in
                self.coordinator?.dismissAlbumViewController()
            })
            .disposed(by: disposeBag)
        
        return Output(didLoadAlbum: didLoadAlbum.asDriver(),
                      didPressPhotoItem: didPressPhotoItem.asSignal()
                      , didXButtonTapped: didXButtonTapped.asSignal())
    }
}

extension AlbumViewModel {
    
    func photoDidTap(index: Int) {
    
        if selectedPhotos.contains(index) {
            guard let order = selectedPhotos.firstIndex(of: index) else { return }
            selectedPhotos.remove(at: order)
        } else {
            selectedPhotos.append(index)
        }
        
        photoData.forEach { _ in
            photoData[index].index = 0
        }
        
        selectedPhotos.enumerated()
            .forEach { number, index in
                photoData[index].index = number + 1
        }
        
        didLoadAlbum.accept(photoData)
    }
}
