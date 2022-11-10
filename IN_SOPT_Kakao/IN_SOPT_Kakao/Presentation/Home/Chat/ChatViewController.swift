//
//  ChatViewController.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/12.
//

import UIKit

import RxSwift
import RxCocoa

final class ChatViewController: UIViewController {
    
    private lazy var chatView = ChatView()
    
    var viewModel: ChatViewModel
    
    private var sections = Section.allSections
    private var dataSource: UICollectionViewDiffableDataSource<Section, Profile>!
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Profile>
    
    private lazy var input = ChatViewModel.Input(viewDidLoad: didLoad.asSignal(),
                                                 pressPlusButton: chatView.navigationBar.plusButton.rx.tap.asSignal())
    private lazy var output = viewModel.transform(input: input)
    private let pressPlusButton = PublishRelay<Void>()
    private let didLoad = PublishRelay<Void>()

    private let disposeBag = DisposeBag()
   
    init(viewModel: ChatViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = chatView
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
        
        output.didPlusButtonTapped
            .emit()
            .disposed(by: disposeBag)
        
        output.didLoadProfile
            .asDriver()
            .drive { profile in
                var snapshot = NSDiffableDataSourceSnapshot<Section, Profile>()
                snapshot.appendSections(self.sections)
                self.sections.forEach { section in
                    snapshot.appendItems(section.profile, toSection: section)
                }
                self.dataSource.apply(snapshot, animatingDifferences: true)
            }
            .disposed(by: disposeBag)
    }
}

extension ChatViewController {
    
    private func configureDataSource() {
     
        
        let cellRegistration = UICollectionView.CellRegistration<ChatCell, Profile> { cell, indexPath, item in
            cell.configure(profile: item)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Profile>(collectionView: chatView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}
