//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 2.07.2021.
//

import UIKit
import SnapKit

class GFUserInfoHeaderViewController: UIViewController {
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        configureUIElements()
    }
    
    private func layoutUI() {
        view.addSubviews(avatarImageView, usernameLabel, nameLabel, locationImageView, locationLabel, bioLabel)
        
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(padding)
            make.leading.equalTo(view.snp.leading)
            make.width.equalTo(90)
            make.height.equalTo(avatarImageView.snp.width)
        }
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.top)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(38)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(avatarImageView.snp.centerY).offset(8)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(20)
        }
        locationImageView.snp.makeConstraints { make in
            make.bottom.equalTo(avatarImageView.snp.bottom)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.width.equalTo(20)
            make.height.equalTo(locationImageView.snp.width)
        }
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationImageView.snp.centerY)
            make.leading.equalTo(locationImageView.snp.trailing).offset(5)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(20)
        }
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(textImagePadding)
            make.leading.equalTo(avatarImageView.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(60)
        }
    }
    
    private func configureUIElements() {
        downloadAvatarImage()
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationImageView.image = SFSymbols.location
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio
        bioLabel.numberOfLines = 3
        locationImageView.tintColor = .secondaryLabel
        
    }
    
    func downloadAvatarImage() {
        NetworkManager.shared.downloadImage(from: user.avatarUrl) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.avatarImageView.image = image }
        }
    }

}
