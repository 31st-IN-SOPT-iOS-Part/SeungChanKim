//
//  FriendViewController.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/12.
//

import UIKit

import RxSwift
import RxCocoa

final class FriendViewController: BaseViewController {
    
    private let friendView = FriendView()
    
    private var viewModel: FriendViewModel
    
    private lazy var input = FriendViewModel.Input(pressBackground: friendView.backgroundButton.rx.tap.asSignal())
    private lazy var output = viewModel.transform(input: input)
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = friendView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        friendView.backgroundButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        friendView.backgroundButton.rx.tap.bind {
            print("22")
        }
        .disposed(by: disposeBag)
    }
    
    init(viewModel: FriendViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bind() {
        
        
        output.didBackgroundTapped
                .emit { [weak self] in}
                .disposed(by: disposeBag)
    }
}
