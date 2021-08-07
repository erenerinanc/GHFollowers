//
//  FavoriteCell.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 13.07.2021.
//

import UIKit
import SnapKit

class FavoriteCell: UITableViewCell {
    static let reuseId = "FavoriteCell"
    
    let avatarImageView     = GFAvatarImageView(frame: .zero)
    let usernameLabel       = GFTitleLabel(textAlignment: .left, fontSize: 26)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        NetworkManager.shared.downloadImage(from: favorite.avatarUrl) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.avatarImageView.image = image }
        }
    }
    
    private func configure() {
        addSubviews(avatarImageView, usernameLabel)
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        avatarImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(self.snp.leading).offset(padding)
            make.width.equalTo(60)
            make.height.equalTo(avatarImageView.snp.width)
        }
        usernameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(24)
            make.trailing.equalTo(self.snp.trailing).inset(padding)
            make.height.equalTo(40)
        }
    }



}
