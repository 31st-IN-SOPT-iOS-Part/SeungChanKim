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
    
    private lazy var input = FriendViewModel.Input(pressBackground: pressProfileCell.asSignal(),
                                                   viewDidLoad: didLoad.asSignal())
    private lazy var output = viewModel.transform(input: input)
    private let didLoad = PublishRelay<Void>()
    private let pressProfileCell = PublishRelay<Int>()
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = friendView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init(viewModel: FriendViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bind() {
        
        output
            .didLoadProfile
            .drive(friendView.profileTableView.rx.items) { (tableView, row, item) -> UITableViewCell in
                        
                if row == 0 {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileTableViewCell.identifier, for: IndexPath(row: row, section: 0))
                            as? MyProfileTableViewCell else { return UITableViewCell() }
                    
                    return cell
                } else {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendProfileTableViewCell.identifier,
                                                                   for: IndexPath(row: row, section: 0))
                            as? FriendProfileTableViewCell else { return UITableViewCell() }
                    cell.configure(profile: item)
                    return cell
                }
        }
        .disposed(by: disposeBag)
        
        friendView.profileTableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}

extension FriendViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        indexPath.row == 0 ? 73 : 60
    }
}
