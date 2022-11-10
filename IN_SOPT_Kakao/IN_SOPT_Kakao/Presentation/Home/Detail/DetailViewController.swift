//
//  DetailViewController.swift
//  IN_SOPT_Kakao
//
//  Created by 김승찬 on 2022/10/13.
//

import UIKit

import RxSwift
import RxCocoa

final class DetailViewController: BaseViewController {
    
    private var viewTranslation = CGPoint(x: 0, y: 0)
    private var viewVelocity = CGPoint(x: 0, y: 0)
    
    private let detailView = DetailView()
    private var viewModel: DetailViewModel
    private lazy var input = DetailViewModel.Input(pressXButton: detailView.xButton.rx.tap.asSignal())
    private lazy var output = viewModel.transform(input: input)
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addPanGesture()
    }
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func style() {
        view.backgroundColor = .blue
    }
    
    override func bind() {
 
        output.didXButtonTapped
            .emit { [weak self] in}
            .disposed(by: disposeBag)
    }
}

extension DetailViewController {
    private func addPanGesture() {
        let viewPan = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))
        viewPan.delaysTouchesBegan = false
        viewPan.delaysTouchesEnded = false
        view.addGestureRecognizer(viewPan)
    }
    
    @objc
    private func viewPanned(_ sender: UIPanGestureRecognizer) {
        viewTranslation = sender.translation(in: view)
        viewVelocity = sender.velocity(in: view)
        
        switch sender.state {
        case .changed:
            if viewVelocity.y > 0 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
                })
            }
        case .ended:
            if viewTranslation.y < 400 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.view.transform = .identity
                })
            } else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
}
