//
//  GalleryViewController.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/11/01.
//

import UIKit

import RxSwift
import RxCocoa

final class AlbumViewController: UIViewController {
    
    private lazy var albumView = AlbumView()
    private var dataSource: UICollectionViewDiffableDataSource<Int, Album>!
   
    private var viewModel: AlbumViewModel
    private lazy var input = AlbumViewModel.Input(viewDidLoad: didLoad.asSignal(),
                                                  pressPhotoItem: pressPhotoItem.asSignal(),
                                                  pressXButton: albumView.xButton.rx.tap.asSignal())
    private lazy var output = viewModel.transform(input: input)
    
    private let pressPhotoItem = PublishRelay<Int>()
    private let didLoad = PublishRelay<Void>()
    private let disposeBag = DisposeBag()
    
    init(viewModel: AlbumViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("SignUpViewController Error!")
    }
    
    override func loadView() {
        self.view = albumView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        configureDataSource()
        bind()
    }
    
    private func style() {
        view.backgroundColor = .white
    }
    
    private func bind() {

        albumView.collectionView.rx.itemSelected
            .asDriver()
            .drive { indexPath in
                if indexPath.row != 0 {
                    self.pressPhotoItem.accept(indexPath.row)
                }
            }
            .disposed(by: disposeBag)

        output.didLoadAlbum
            .asDriver()
            .drive { photos in
                var snapshot = NSDiffableDataSourceSnapshot<Int, Album>()
                snapshot.appendSections([0])
                snapshot.appendItems(photos)
                self.dataSource.apply(snapshot, animatingDifferences: true)
            }
            .disposed(by: disposeBag)
    }
}

extension AlbumViewController {
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<AlbumCell, Album> { cell, indexPath, item in
            cell.configure(album: item, with: item.index)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Int, Album>(collectionView: albumView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}
