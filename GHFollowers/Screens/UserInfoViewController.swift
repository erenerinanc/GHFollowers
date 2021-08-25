//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 2.07.2021.
//

import UIKit
import SnapKit

protocol UserInfoViewControllerDelegate: class {
    func didRequestFollowers(for username: String)
}

class UserInfoViewController: GFDataLoadingViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    var itemViews = [UIView]()
    
    var username: String!
    weak var delegate: UserInfoViewControllerDelegate!


    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureScrollView()
        layoutUI()
        getUserInfo()
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func configureScrollView() {
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        #warning("MAke it with SnapKit")
        scrollView.pinToEdges(to: view)
        contentView.pinToEdges(to: scrollView)
        
        contentView.snp.makeConstraints { (make) in
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(2000)
        }
    }
    
    private func getUserInfo() {
        self.showLoadingView()
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async { self.configureUIElements(with: user) }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    private func configureUIElements(with user: User) {
        self.add(childVC: GFRepoItemViewController(user: user, delegate: self), to: self.itemViewOne)
        self.add(childVC: GFFollowerItemViewController(user: user, delegate: self), to: self.itemViewTwo)
        self.add(childVC: GFUserInfoHeaderViewController(user: user), to: self.headerView)
        self.dateLabel.text = "GitHub since \(user.createdAt.convertToMonthYearFormat())"
    }
    
    private func layoutUI() {
        itemViews = [headerView, itemViewOne,itemViewTwo,dateLabel]
        
        let itemHeight: CGFloat = 140
        let padding: CGFloat = 20
        
        for itemView in itemViews {
            contentView.addSubview(itemView)
            
            itemView.snp.makeConstraints { (make) in
                make.leading.equalTo(contentView.snp.leading).inset(padding)
                make.trailing.equalTo(contentView.snp.trailing).inset(padding)
            }
        }
        
        headerView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top)
            make.height.equalTo(180)
        }
        
        itemViewOne.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom).offset(padding)
            make.height.equalTo(itemHeight)
        }
        
        itemViewTwo.snp.makeConstraints { (make) in
            make.top.equalTo(itemViewOne.snp.bottom).offset(padding)
            make.height.equalTo(itemHeight)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(itemViewTwo.snp.bottom).offset(padding)
            make.height.equalTo(18)
        }
    }
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}

extension UserInfoViewController: GFRepoItemVCDelegate {
    
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The url attached to this user is invalid.", buttonTitle: "Ok")
            return
        }

        presentSafariVC(with: url)
        
    }
}


extension UserInfoViewController: GFFollowerItemVCDelegate {
    
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No followers", message: "This user has no followers. What a shame 😞.", buttonTitle: "So sad")
            return
        }
        
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
}


    

