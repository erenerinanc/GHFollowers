//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 3.07.2021.
//

import UIKit

protocol GFFollowerItemVCDelegate: class {
    func didTapGetFollowers(for user: User)
}

class GFFollowerItemViewController: GFItemInfoViewController {
    
    weak var delegate: GFFollowerItemVCDelegate!
    
    
    init(user: User, delegate: GFFollowerItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
