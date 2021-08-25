//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 3.07.2021.
//

import UIKit
import SnapKit

class GFItemInfoViewController: UIViewController {
    let stackView = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton = GFButton()
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        configureStackView()
        layoutUI()
        configureActionButton()
    }

    private func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
        
    }
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }
    
    private func configureActionButton() {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc func actionButtonTapped() {}
    
    private func layoutUI() {
        view.addSubviews(stackView, actionButton)
        
        let padding: CGFloat = 20
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(padding)
            make.leading.equalTo(view.snp.leading).inset(padding)
            make.trailing.equalTo(view.snp.trailing).offset(padding)
            make.height.equalTo(50)
        }
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).inset(padding)
            make.leading.equalTo(view.snp.leading).inset(padding)
            make.trailing.equalTo(view.snp.trailing).inset(padding)
            make.height.equalTo(44)
        }
    }
}
