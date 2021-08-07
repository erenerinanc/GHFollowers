//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 26.06.2021.
//

import UIKit
import SnapKit

class FollowerCell: UICollectionViewCell {
    static let reuseID      = "FollowerCell"
    
    let avatarImageView     = GFAvatarImageView(frame: .zero)
    let usernameLabel       = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        NetworkManager.shared.downloadImage(from: follower.avatarUrl) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.avatarImageView.image = image }
        }
    }
    
    private func configure() {
        addSubviews(avatarImageView, usernameLabel)
        
        let padding: CGFloat = 8
        avatarImageView.snp.makeConstraints { (make) in
            make.height.equalTo(avatarImageView.snp.width)
            make.top.equalTo(contentView.snp.top).offset(padding)
            make.leading.equalTo(contentView.snp.leading).offset(padding)
            make.trailing.equalTo(contentView.snp.trailing).inset(padding)
        }
        usernameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avatarImageView.snp.bottom).offset(12)
            make.leading.equalTo(contentView.snp.leading).offset(padding)
            make.trailing.equalTo(contentView.snp.trailing).inset(padding)
            make.height.equalTo(20)
        }
        
    }
    
}
