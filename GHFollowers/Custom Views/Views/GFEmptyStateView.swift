//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 1.07.2021.
//

import UIKit
import SnapKit

class GFEmptyStateView: UIView {
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    
    private func layoutUI() {
        addSubviews(messageLabel,logoImageView)
        
        messageLabel.numberOfLines  = 3
        messageLabel.textColor      = .secondaryLabel
        logoImageView.image         = Images.emptyStateLogo
        
        messageLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY).offset(-160)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing).offset(-40)
            make.height.equalTo(200)
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(1)
            make.height.equalTo(self.snp.height).multipliedBy(0.8)
            make.trailing.equalTo(self.snp.trailing).offset(170)
            make.bottom.equalTo(self.snp.bottom).offset(100)
        }
    }


}
