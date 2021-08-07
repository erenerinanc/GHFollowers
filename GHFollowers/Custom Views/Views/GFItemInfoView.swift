//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 3.07.2021.
//

import UIKit
import SnapKit

enum ItemInfoType {
    case repos,gists,followers,following
}


class GFItemInfoView: UIView {
    let symbolImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUI() {
        addSubviews(symbolImageView, titleLabel, countLabel)
        
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        symbolImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(symbolImageView.snp.centerY)
            make.leading.equalTo(symbolImageView.snp.trailing).offset(12)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(18)
        }
        
        countLabel.snp.makeConstraints { (make) in
            make.top.equalTo(symbolImageView.snp.bottom).offset(4)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(18)
        }
      
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        countLabel.text = String(count)
        
        switch itemInfoType {
        case .repos:
            symbolImageView.image = SFSymbols.repos
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImageView.image = SFSymbols.gists
            titleLabel.text = "Public Gists"
        case .followers:
            symbolImageView.image = SFSymbols.followers
            titleLabel.text = "Followers"
        case .following:
            symbolImageView.image = SFSymbols.following
            titleLabel.text = "Following"
        }
    }



}
