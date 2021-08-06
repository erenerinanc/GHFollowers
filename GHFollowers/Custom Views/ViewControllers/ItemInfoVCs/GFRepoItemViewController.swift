//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 3.07.2021.
//

import Foundation

protocol GFRepoItemVCDelegate: class {
    func didTapGitHubProfile(for user: User)
}

class GFRepoItemViewController: GFItemInfoViewController {
    
    weak var delegate: GFRepoItemVCDelegate!
    
    init(user: User, delegate: GFRepoItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
